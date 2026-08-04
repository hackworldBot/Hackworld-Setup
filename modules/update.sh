#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Module : System Update
# ==========================================

module_id() {
    echo "update"
}

module_name() {
    echo "System Update"
}

module_version() {
    echo "1.0.0"
}

module_description() {
    echo "Update and clean the Debian system."
}

module_install() {

    ui_title "System Update"

    log_info "Updating package lists"
    sudo apt update

    log_info "Upgrading packages"
    sudo apt full-upgrade -y

    log_info "Removing unused packages"
    sudo apt autoremove --purge -y

    log_info "Cleaning package cache"
    sudo apt autoclean
    sudo apt clean

    log_info "Repairing packages"
    sudo apt --fix-broken install -y
    sudo dpkg --configure -a

    ui_success "System update completed."

}

module_verify() {

    return 0

}