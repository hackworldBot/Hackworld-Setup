#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Colors Library
# ==========================================

# ---------- Couleurs ----------

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[1;37m"

BOLD="\033[1m"
RESET="\033[0m"

# ---------- Icônes ----------

ICON_SUCCESS="✔"
ICON_ERROR="✘"
ICON_WARNING="⚠"
ICON_INFO="ℹ"

# ---------- Interface ----------

ui_title() {

    echo

    echo -e "${BLUE}${BOLD}============================================================${RESET}"
    echo -e "${WHITE}${BOLD} $1${RESET}"
    echo -e "${BLUE}${BOLD}============================================================${RESET}"

    echo

}

ui_success() {

    echo -e "${GREEN}${ICON_SUCCESS}${RESET} $1"

}

ui_error() {

    echo -e "${RED}${ICON_ERROR}${RESET} $1"

}

ui_warning() {

    echo -e "${YELLOW}${ICON_WARNING}${RESET} $1"

}

ui_info() {

    echo -e "${CYAN}${ICON_INFO}${RESET} $1"

}

separator() {

    echo "------------------------------------------------------------"

}