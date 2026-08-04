#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# checks.sh
# Vérifications système
# ==========================================

check_internet() {
    ping -c 1 1.1.1.1 >/dev/null 2>&1
}

check_debian() {
    [[ -f /etc/debian_version ]]
}

check_uefi() {
    [[ -d /sys/firmware/efi ]]
}

check_nvidia() {
    lspci | grep -qi nvidia
}

check_intel() {
    lscpu | grep -qi intel
}

check_ssd() {
    lsblk -d -o rota | grep -q "^0$"
}

get_ram() {
    free -h | awk '/Mem:/ {print $2}'
}