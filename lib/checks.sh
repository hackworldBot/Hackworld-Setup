#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# System Checks Library
# ==========================================

# Vérifie que la distribution est Debian
check_debian() {

    [[ -f /etc/debian_version ]]

}

# Vérifie la connexion Internet
check_internet() {

    ping -c 1 -W 2 1.1.1.1 >/dev/null 2>&1

}

# Vérifie si le système démarre en UEFI
check_uefi() {

    [[ -d /sys/firmware/efi ]]

}

# Vérifie la présence de sudo
check_sudo() {

    command -v sudo >/dev/null 2>&1

}

# Vérifie la présence d'une carte NVIDIA
check_nvidia() {

    lspci | grep -qi "NVIDIA"

}

# Vérifie la présence d'un processeur Intel
check_intel() {

    lscpu | grep -qi "Intel"

}

# Vérifie si au moins un SSD est présent
check_ssd() {

    lsblk -d -o ROTA | grep -q "^0$"

}

# Retourne la quantité de RAM
get_ram() {

    free -h | awk '/^Mem:/ {print $2}'

}

# Retourne le modèle du processeur
get_cpu() {

    lscpu | awk -F: '/Model name/ {
        gsub(/^[ \t]+/, "", $2)
        print $2
    }'

}

# Retourne la version de Debian
get_debian_version() {

    cat /etc/debian_version

}

# Retourne la version du noyau
get_kernel_version() {

    uname -r

}