#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# logger.sh
# Gestion des journaux
# ==========================================

LOG_DIR="logs"
LOG_FILE="${LOG_DIR}/install.log"

mkdir -p "${LOG_DIR}"
touch "${LOG_FILE}"

timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

log() {
    local level="$1"
    shift

    echo "[$(timestamp)] [$level] $*" >>"${LOG_FILE}"
}

log_info() {
    log INFO "$@"
}

log_success() {
    log SUCCESS "$@"
}

log_warning() {
    log WARNING "$@"
}

log_error() {
    log ERROR "$@"
}
