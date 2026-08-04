#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Module : Git Development
# ==========================================

module_id() {
    echo "git"
}

module_name() {
    echo "Git"
}

module_version() {
    echo "1.0.0"
}

module_description() {
    echo "Install and configure Git."
}

module_install() {

    ui_title "Git Installation"

    log_info "Updating package list"
    sudo apt update

    log_info "Installing Git"
    sudo apt install -y git git-lfs gh openssh-client

    ui_success "Git installed"

    # ----------------------------
    # Git configuration
    # ----------------------------

    local username
    local email

    echo
    read -rp "Git username : " username
    read -rp "Git email    : " email

    git config --global user.name "${username}"
    git config --global user.email "${email}"
    git config --global init.defaultBranch main
    git config --global pull.rebase false

    ui_success "Git configured"

    # ----------------------------
    # SSH
    # ----------------------------

    if [[ ! -f "${HOME}/.ssh/id_ed25519" ]]; then

        ui_info "Generating SSH key..."

        ssh-keygen -t ed25519 \
            -C "${email}" \
            -f "${HOME}/.ssh/id_ed25519" \
            -N ""

        ui_success "SSH key created"

    else

        ui_success "SSH key already exists"

    fi

    eval "$(ssh-agent -s)" >/dev/null

    ssh-add "${HOME}/.ssh/id_ed25519" >/dev/null 2>&1 || true

    echo
    ui_info "Public SSH key"
    echo

    cat "${HOME}/.ssh/id_ed25519.pub"

    echo
    ui_info "Add this key to your GitHub account:"
    ui_info "https://github.com/settings/keys"

    echo
    read -rp "Press ENTER when the key has been added..."

    echo

    ssh -T git@github.com || true

    ui_success "Git module completed"

}

module_verify() {

    command -v git >/dev/null &&
    command -v gh >/dev/null

}