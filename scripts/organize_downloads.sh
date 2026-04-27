#!/bin/bash
# organizar-downloads.sh — Organiza arquivos por tipo de extensao (Linux)
# Uso: ./organizar-downloads.sh [pasta]   (padrao: ~/Downloads)

set -eo pipefail

GREEN='\033[1;32m'
CYAN='\033[1;36m'
DIM='\033[0;90m'
BOLD='\033[1m'
RESET='\033[0m'

TARGET="${1:-.}"
TARGET="${TARGET%/}"

if [ ! -d "$TARGET" ]; then
    echo "Error: '$TARGET' not a valid directory." >&2
    exit 1
fi

get_category() {
    local ext="$1"
    case "$ext" in
        jpg|jpeg|png|gif|bmp|svg|webp|ico|tiff|heic|heif|raw|cr2|nef|avif)
            echo "Images" ;;
        pdf|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|rtf|tex|pages|numbers|key|epub)
            echo "Documents" ;;
        mp4|mov|avi|mkv|wmv|flv|webm|m4v|mpg|mpeg|ts)
            echo "Videos" ;;
        mp3|wav|flac|aac|ogg|wma|m4a|opus|aiff|alac)
            echo "Audio" ;;
        dmg|pkg|exe|msi|deb|rpm|appimage|snap|flatpak)
            echo "Installers" ;;
        zip|rar|7z|tar|gz|bz2|xz|tgz|zst)
            echo "Compacted" ;;
        py|js|html|css|sh|json|xml|yaml|yml|md|csv|sql|rb|go|rs|java|c|cpp|h|swift|kt|lua|r)
            echo "Code" ;;
        *)
            echo "Others" ;;
    esac
}

MOVED=0
COUNTS_FILE=$(mktemp)
trap 'rm -f "$COUNTS_FILE"' EXIT

echo ""
echo -e "  Escaneando ${BOLD}$TARGET${RESET}..."

for file in "$TARGET"/*; do
    [ -f "$file" ] || continue

    filename=$(basename "$file")

    # Ignorar dotfiles
    case "$filename" in
        .*) continue ;;
    esac

    # Extrair extensao (lowercase)
    ext="${filename##*.}"
    ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

    # Se nao tem extensao
    if [ "$filename" = "$ext" ]; then
        category="Others"
    else
        category=$(get_category "$ext")
    fi

    # Criar pasta destino
    dest="$TARGET/$category"
    mkdir -p "$dest"

    # Resolver conflito de nomes
    dest_file="$dest/$filename"
    if [ -e "$dest_file" ]; then
        base="${filename%.*}"
        suffix="${filename##*.}"
        n=1
        while [ -e "$dest/$base ($n).$suffix" ]; do
            n=$((n + 1))
        done
        dest_file="$dest/$base ($n).$suffix"
    fi

    mv "$file" "$dest_file"
    echo -e "  ${DIM}→${RESET} $filename ${DIM}→${RESET} ${CYAN}$category/${RESET}"
    echo "$category" >> "$COUNTS_FILE"
    MOVED=$((MOVED + 1))
done

echo ""

if [ $MOVED -eq 0 ]; then
    echo -e "  ${DIM}No file to organize.${RESET}"
else
    echo -e "  ${GREEN}✓ $MOVED files organized:${RESET}"
    echo ""
    sort "$COUNTS_FILE" | uniq -c | sort -rn | while read -r count cat; do
        printf "  %-16s ${BOLD}%d${RESET} files\n" "$cat:" "$count"
    done
fi
echo ""
