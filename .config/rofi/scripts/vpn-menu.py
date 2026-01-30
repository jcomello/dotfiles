#!/usr/bin/env python3

import subprocess


class VPNMenu:
    def __init__(self):
        self.connections = self.__vpn_connection_list()
        self.active_connections = self.__active_vpn_connection_list()

    def __vpn_connection_list(self):
        connections = self.__get_connections(
            ["nmcli", "--mode", "tabular", "--terse", "connection", "show"]
        )
        return self.__filter_vpn_connections(connections)

    def __active_vpn_connection_list(self):
        active_connections = self.__get_connections(
            ["nmcli", "--mode", "tabular", "--terse", "connection", "show", "--active"]
        )
        return self.__filter_vpn_connections(active_connections)

    def __filter_vpn_connections(self, connections):
        return [line.split(":")[0] for line in connections if "vpn" in line]

    def __is_vpn_active(self):
        return len(self.active_connections) > 0

    def __get_connections(self, command):
        return (
            subprocess.run(
                command,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=True,
            )
            .stdout.strip()
            .split("\n")
        )

    def __run_action(self, selection):
        if not selection:
            return

        if self.__is_vpn_active():
            subprocess.run(["nmcli", "connection", "down", selection])
        else:
            subprocess.run(["nmcli", "connection", "up", selection])

    def menu_title(self):
        if self.__is_vpn_active():
            return "VPN connections - Active"
        else:
            return "VPN connections - Inactive"

    def rofi_list(self):
        if self.__is_vpn_active():
            return self.active_connections
        else:
            return self.connections

    def rofi_menu(self):
        elements = self.rofi_list()
        result = subprocess.getoutput(
            f"echo -e '{'\n'.join(elements)}' | rofi -dmenu -p '{self.menu_title()}'"
        )
        self.__run_action(result)


def main():
    VPNMenu().rofi_menu()


if __name__ == "__main__":
    main()
