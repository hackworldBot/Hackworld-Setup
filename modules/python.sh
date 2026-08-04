#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Module : Python Development
# ==========================================

module_id() {
    echo "python"
}

module_name() {
    echo "Python"
}

module_version() {
    echo "1.0.0"
}

module_description() {
    echo "Install a complete Python development environment."
}

module_install() {

    ui_title "Python Development"

    log_info "Updating package list"
    sudo apt update

    log_info "Installing Python packages"

    sudo apt install -y \
        python3 \
        python3-pip \
        python3-venv \
        python3-dev \
        python3-full \
        python3-setuptools \
        python3-wheel \
        python3-build \
        pipx \
        ipython3

    pipx ensurepath

    log_info "Installing Python development tools"

    python3 -m pip install --user --upgrade pip

    python3 -m pip install --user \
        black \
        ruff \
        pytest \
        virtualenv

    ui_success "Python environment installed"

}

module_verify() {

    command -v python3 >/dev/null &&
    command -v pip3 >/dev/null

}