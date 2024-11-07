#!/bin/sh

# uptime="$(uptime | awk -F '(:| |,)' '{print $9 " hours, " $10 " minutes"}')"

shutdown="󰐥" # \Uf0425
lock="󰌾"     # \Uf033e
reboot="󰜉"   # \Uf0709
snooze="󰒲"   # \Uf04b2
leave="󰍃"    # \Uf0343
options="$lock\n$shutdown\n$reboot\n$snooze\n$leave"
rofi=$(printf $options | rofi -config ~/.config/rofi/shutdown/config.rasi -dmenu -monitor -2)

case $rofi in
    $lock)
        lock_screen ;;
    $shutdown)
        shutdown now ;;
    $reboot)
        reboot ;;
    $snooze)
        lock_screen
        systemctl suspend ;;
    $leave)
        case $XDG_CURRENT_DESKTOP in
            # AWESOME) awesome exit ;;
            HYPRLAND) hyprctl exit ;;
        esac ;;
esac
