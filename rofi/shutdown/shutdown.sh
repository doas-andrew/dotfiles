#!/bin/sh

# uptime="$(uptime | awk -F '(:| |,)' '{print $9 " hours, " $10 " minutes"}')"

shutdown="襤"
lock=""
reboot="累"
snooze="鈴"
leave=""
options="$lock\n$shutdown\n$reboot\n$snooze\n$leave"

rofi=$(printf $options | rofi -config ~/.config/rofi/shutdown/config.rasi -dmenu)

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
