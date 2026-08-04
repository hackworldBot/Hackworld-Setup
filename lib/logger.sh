#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Logger Library
# ==========================================

LOG_FILE="${LOG_DIR}/install.log"

# Création du dossier de logs
mkdir -p "${LOG_DIR}"

# Création du fichier si nécessaire
touch "${LOG_FILE}"

# ==========================================
# Horodatage
# ==========================================

log_timestamp() {

    date +"%Y-%m-%d %H:%M:%S"

}

# ==========================================
# Fonction interne
# ==========================================

log_write() {

    local level="$1"
    shift

    printf "[%s] [%s] %s\n" \
        "$(log_timestamp)" \
        "${level}" \
        "$*" >> "${LOG_FILE}"

}

# ==========================================
# API Publique
# ==========================================

log_info() {

    log_write "INFO" "$@"

}

log_success() {

    log_write "SUCCESS" "$@"

}

log_warning() {

    log_write "WARNING" "$@"

}

log_error() {

    log_write "ERROR" "$@"

}

# ==========================================
# Nettoyage du log
# ==========================================

log_clear() {

    : > "${LOG_FILE}"

}