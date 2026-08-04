#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Helpers Library
# ==========================================

# Vérifie si une commande existe
command_exists() {

    command -v "$1" >/dev/null 2>&1

}

# Vérifie si le script est exécuté en root
is_root() {

    [[ "${EUID}" -eq 0 ]]

}

# Vérifie si sudo est disponible
has_sudo() {

    command_exists sudo

}

# Demande une confirmation
confirm() {

    local message="${1:-Continue?}"
    local answer

    while true; do

        read -rp "${message} [y/N]: " answer

        case "${answer}" in
            y|Y|yes|YES)
                return 0
                ;;
            n|N|no|NO|"")
                return 1
                ;;
            *)
                ui_warning "Please answer yes or no."
                ;;
        esac

    done

}

# Pause
pause() {

    read -rp "Press Enter to continue..."

}

# Ligne de séparation
separator() {

    printf '=%.0s' {1..60}
    printf '\n'

}

# Vérifie qu'un fichier existe
file_exists() {

    [[ -f "$1" ]]

}

# Vérifie qu'un dossier existe
directory_exists() {

    [[ -d "$1" ]]

}

# Vérifie qu'un programme est installé
require_command() {

    local cmd="$1"

    if ! command_exists "${cmd}"; then

        ui_error "Missing required command: ${cmd}"
        exit 1

    fi

}

# Vérifie qu'un fichier existe sinon quitte
require_file() {

    local file="$1"

    if ! file_exists "${file}"; then

        ui_error "Missing file: ${file}"
        exit 1

    fi

}

# Vérifie qu'un dossier existe sinon quitte
require_directory() {

    local dir="$1"

    if ! directory_exists "${dir}"; then

        ui_error "Missing directory: ${dir}"
        exit 1

    fi

}