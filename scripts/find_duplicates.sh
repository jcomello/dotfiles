#!/bin/bash
# find_duplicates.sh — Finds duplicate files by hash SHA-256 (Linux)
# Usage: ./find_duplicates.sh [folder] [minimum-size-bytes]
# Default: ~/  with minumum of 1 KB
# No file deleted — only listed

set -eo pipefail

YELLOW='\033[1;33m'
RED='\033[1;31m'
GREEN='\033[1;32m'
BOLD='\033[1m'
DIM='\033[0;90m'
RESET='\033[0m'

TARGET="${1:-.}"
TARGET="${TARGET%/}"
MIN_SIZE="${2:-1024}"

if [ ! -d "$TARGET" ]; then
    echo "Erro: '$TARGET' not a valid directory." >&2
    exit 1
fi

TMPDIR_WORK=$(mktemp -d)
trap 'rm -rf "$TMPDIR_WORK"' EXIT

SIZE_FILE="$TMPDIR_WORK/sizes"
HASH_FILE="$TMPDIR_WORK/hashes"

human_size() {
    local bytes=$1
    if [ "$bytes" -ge 1073741824 ]; then
        echo "$(echo "scale=1; $bytes / 1073741824" | bc) GB"
    elif [ "$bytes" -ge 1048576 ]; then
        echo "$(echo "scale=1; $bytes / 1048576" | bc) MB"
    elif [ "$bytes" -ge 1024 ]; then
        echo "$((bytes / 1024)) KB"
    else
        echo "${bytes} B"
    fi
}

echo ""
echo -e "  scanning ${BOLD}$TARGET${RESET}..."
echo -e "  ${DIM}(ignoring files < $(human_size "$MIN_SIZE"))${RESET}"
echo ""

# Step 1: List files with sizes
echo -ne "  Listing files...\r"
find "$TARGET" -type f -size +"${MIN_SIZE}c" \
    -not -path '*/\.*' \
    -not -path '*/node_modules/*' \
    -not -path '*/.venv/*' \
    -not -path '*/venv/*' \
    -not -path '*/__pycache__/*' \
    -not -path '*/.git/*' \
    2>/dev/null | while IFS= read -r f; do
    # Linux: stat -c '%s' em vez de stat -f '%z'
    size=$(stat -c '%s' "$f" 2>/dev/null || echo 0)
    echo "$size|$f"
done > "$SIZE_FILE"

total_files=$(wc -l < "$SIZE_FILE" | tr -d ' ')
echo -e "  ${BOLD}$total_files${RESET} found files"
echo ""

# Step 2: Find duplicated sizes (pre-filter)
echo -ne "  Grouping by sizes ...\r"
awk -F'|' '{print $1}' "$SIZE_FILE" | sort | uniq -d > "$TMPDIR_WORK/dup_sizes"

if [ ! -s "$TMPDIR_WORK/dup_sizes" ]; then
    echo -e "  ${GREEN}✓ No duplicates found.${RESET}"
    echo ""
    exit 0
fi

# Step 3: Filter candidates only
> "$TMPDIR_WORK/candidates"
while read -r dup_size; do
    grep "^${dup_size}|" "$SIZE_FILE" >> "$TMPDIR_WORK/candidates" || true
done < "$TMPDIR_WORK/dup_sizes"

candidates=$(wc -l < "$TMPDIR_WORK/candidates" | tr -d ' ')
echo -e "  ${BOLD}$candidates${RESET} duplicate candidates (same size)"

# Step 4: Calculate hashes
hashed=0
> "$HASH_FILE"
while IFS='|' read -r size filepath; do
    # Linux: sha256sum insted shasum -a 256
    hash=$(sha256sum "$filepath" 2>/dev/null | awk '{print $1}')
    if [ -n "$hash" ]; then
        echo "$hash|$size|$filepath" >> "$HASH_FILE"
    fi
    hashed=$((hashed + 1))
    if [ $((hashed % 50)) -eq 0 ]; then
        echo -ne "\r  Calculating hashes... $hashed/$candidates"
    fi
done < "$TMPDIR_WORK/candidates"

echo -e "\r  Cauculating hashes... ${GREEN}feito${RESET}          "
echo ""

# Step 5: Find duplicated hashes
awk -F'|' '{print $1}' "$HASH_FILE" | sort | uniq -d > "$TMPDIR_WORK/dup_hashes"

if [ ! -s "$TMPDIR_WORK/dup_hashes" ]; then
    echo -e "  ${GREEN}✓ No duplicates found.${RESET}"
    echo ""
    exit 0
fi

# Step 6: Show results
echo -e "  ${BOLD}Duplicates found:${RESET}"
echo ""

group_num=0
total_dup_files=0
total_recoverable=0

while read -r dup_hash; do
    group_num=$((group_num + 1))

    # Fetch data
    group_lines=$(grep "^${dup_hash}|" "$HASH_FILE")
    copies=$(echo "$group_lines" | wc -l | tr -d ' ')
    first_size=$(echo "$group_lines" | head -1 | awk -F'|' '{print $2}')
    recoverable=$((first_size * (copies - 1)))
    total_recoverable=$((total_recoverable + recoverable))
    total_dup_files=$((total_dup_files + copies))

    echo -e "  ${YELLOW}Group $group_num${RESET} — $copies copies — ${RED}$(human_size "$recoverable")${RESET} recoverables"
    echo -e "  ${DIM}SHA-256: ${dup_hash:0:16}...${RESET}"

    echo "$group_lines" | while IFS='|' read -r _ _ filepath; do
        display="${filepath/$HOME/\~}"
        echo "    $display"
    done
    echo ""
done < "$TMPDIR_WORK/dup_hashes"

# Summary
echo "  ─────────────────────────────────"
echo -e "  ${BOLD}Summary:${RESET}"
echo -e "  Duplicates Groups:  ${BOLD}$group_num${RESET}"
echo -e "  Duplicates files:   ${BOLD}$total_dup_files${RESET}"
echo -e "  Recoverable space:    ${RED}${BOLD}$(human_size "$total_recoverable")${RESET}"
echo "  ─────────────────────────────────"
echo ""
echo -e "  ${DIM}No file was deleted. Review the list above and delete manualy.${RESET}"
echo ""
