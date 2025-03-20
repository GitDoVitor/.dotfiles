#!bin/bash
#                      _
# __      ____ _ _   _| |__   __ _ _ __
# \ \ /\ / / _` | | | | '_ \ / _` | '__|
#  \ V  V / (_| | |_| | |_) | (_| | |
#   \_/\_/ \__,_|\__, |_.__/ \__,_|_|
#                |___/
#------------------------------------------------------
# Encerra todas as instâncias do waybar
#------------------------------------------------------
killall waybar
sleep 0.5

# -------------------------------------------------------
#  Recarrega o waybar com o arquivo de configuração e de estilo
# ------------------------------------------------------------
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
