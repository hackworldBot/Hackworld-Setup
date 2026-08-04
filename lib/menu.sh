#!/usr/bin/env bash

# ==========================================
# Hackworld Setup
# Menu Library
# ==========================================

menu_show() {

    clear

    ui_title "Hackworld Setup v0.1.0"

    printf "%-20s : %s\n" "OS" "$(system_get_os)"
    printf "%-20s : %s\n" "CPU" "$(system_get_cpu)"
    printf "%-20s : %s\n" "RAM" "$(system_get_ram)"

    separator

    echo " 1) Mise à jour du système"
    echo " 2) Développement"
    echo " 3) Docker"
    echo " 4) Python"
    echo " 5) Node.js"
    echo " 6) Android"
    echo " 7) Cybersécurité"
    echo " 8) NVIDIA"
    echo " 9) Informations système"
    echo " 0) Quitter"

    separator

}

menu_main() {

    while true; do

        menu_show

        read -rp "Votre choix : " choice

        case "$choice" in

            1)

                source "${MODULE_DIR}/update.sh"

                module_install

                pause

                ;;

            2)

                source "${MODULE_DIR}/git.sh"

                module_install

                pause

                ;;

            3)
                ui_info "Module : Docker"
                pause
                ;;

            4)

                source "${MODULE_DIR}/python.sh"

                module_install

                pause

                ;;

            5)
                ui_info "Module : Node.js"
                pause
                ;;

            6)
                ui_info "Module : Android"
                pause
                ;;

            7)
                ui_info "Module : Cybersécurité"
                pause
                ;;

            8)
                ui_info "Module : NVIDIA"
                pause
                ;;

            9)

                clear

                ui_title "Informations système"

                printf "%-20s : %s\n" "OS" "$(system_get_os)"
                printf "%-20s : %s\n" "Debian" "$(system_get_debian_version)"
                printf "%-20s : %s\n" "Kernel" "$(system_get_kernel)"
                printf "%-20s : %s\n" "CPU" "$(system_get_cpu)"
                printf "%-20s : %s\n" "RAM" "$(system_get_ram)"
                printf "%-20s : %s\n" "GPU" "$(system_get_gpu)"
                printf "%-20s : %s\n" "Internet" "$(system_has_internet)"
                printf "%-20s : %s\n" "UEFI" "$(system_is_uefi)"
                printf "%-20s : %s\n" "SSD" "$(system_has_ssd)"

                pause

                ;;

            0)

                clear
                ui_success "Au revoir."
                exit 0

                ;;

            *)

                ui_error "Choix invalide."
                sleep 1

                ;;

        esac

    done

}