#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# helpers.sh
# Fonctions utilitaires
# ==========================================

# Vérifie si une commande existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Vérifie si le script est lancé en root
is_root() {
    [[ $EUID -eq 0 ]]
}

# Demande une confirmation
confirm() {
    local message="${1:-Continuer ?}"

    while true; do
        read -rp "$message [y/N]: " choice

        case "$choice" in
            y|Y|yes|YES)
                return 0
                ;;
            n|N|no|NO|"")
                return 1
                ;;
            *)
                echo "Répondez par y ou n."
                ;;
        esac
    done
}

# Pause
pause() {
    read -rp "Appuyez sur Entrée pour continuer..."
}

# Ligne de séparation
separator() {
    printf '=%.0s' {1..60}
    echo
}