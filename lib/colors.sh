#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# colors.sh
# Gestion des couleurs et de l'affichage
# ==========================================
source "$(dirname "${BASH_SOURCE[0]}")/logger.sh"

# Couleurs
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[1;37m"

BOLD="\033[1m"
RESET="\033[0m"

# Icônes
OK="✔"
ERROR="✘"
WARN="⚠"
INFO="ℹ"

success() {
    echo -e "${GREEN}${OK} $1${RESET}"
    log_success "$1"
}

error() {
    echo -e "${RED}${ERROR} $1${RESET}"
    log_error "$1"
}

warning() {
    echo -e "${YELLOW}${WARN} $1${RESET}"
    log_warning "$1"
}

info() {
    echo -e "${CYAN}${INFO} $1${RESET}"
    log_info "$1"
}