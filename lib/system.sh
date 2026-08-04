#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# System Library
# ==========================================

system_get_os() {

    source /etc/os-release
    echo "${PRETTY_NAME}"

}

system_get_debian_version() {

    cat /etc/debian_version

}

system_get_kernel() {

    uname -r

}

system_get_architecture() {

    uname -m

}

system_get_hostname() {

    hostname

}

system_get_cpu() {

    awk -F': ' '/^model name/ {
        print $2
        exit
    }' /proc/cpuinfo

}

system_get_cpu_cores() {

    nproc

}

system_get_ram() {

    free -h | awk '/^Mem:/ {print $2}'

}

system_get_gpu() {

    lspci | grep -E "VGA|3D" | sed 's/.*: //'

}

system_is_uefi() {

    if [[ -d /sys/firmware/efi ]]; then
        echo "Yes"
    else
        echo "No"
    fi

}

system_has_internet() {

    if ping -c1 -W2 1.1.1.1 >/dev/null 2>&1; then
        echo "Connected"
    else
        echo "Disconnected"
    fi

}

system_has_nvidia() {

    if lspci | grep -qi nvidia; then
        echo "Yes"
    else
        echo "No"
    fi

}

system_has_ssd() {

    while read -r disk rota; do

        if [[ "$rota" == "0" ]]; then
            echo "Yes"
            return
        fi

    done < <(lsblk -d -n -o NAME,ROTA)

    echo "No"

}