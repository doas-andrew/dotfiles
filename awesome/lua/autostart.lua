-- Autostart windowless processes
-- This code will run once every time Awesome is started
local autostart = {
    "xset r rate 160 60",
    "setxkbmap -option caps:swapescape",
    "pgrep --euid $USER alttab         || alttab -w 1 -vertical -fg '#ebdbb2' -bg '#282828' -frame '#689d6a' -i 32x32 -t 500x32",
    "pgrep --euid $USER blueman-applet || blueman-applet",
    "pgrep --euid $USER volctl         || volctl",
}

 if my.lock_delay or my.sleep_delay then
    table.insert(autostart, string.format("pkill idle_lock; idle_lock %s %s", my.lock_delay, my.sleep_delay))
 end

if my.launcher == "ulauncher" then
    table.insert(autostart, "pgrep --euid $USER ulauncher || ulauncher --hide-window --no-window-shadow")
end

if my.using_mpd then
    table.insert(autostart, "pgrep --euid $USER mpd || mpd")
end

for _, cmd in ipairs(autostart) do
    awful.spawn.with_shell(cmd)
end
