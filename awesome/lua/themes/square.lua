local theme = {}
local assets_dir = CONFIG.."assets/"


--------------------------------------------------------------------------------
-- Assets
--------------------------------------------------------------------------------

theme.font = "Foobar Bold 9"
theme.icons = assets_dir.."icons/copland/"
theme.wallpaper = assets_dir.."wallpapers/doom.png"


--------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------

theme.fg_normal = "#BBBBBB"
theme.fg_focus = "#78A4FF"
theme.bg_normal = "#111111"
theme.bg_focus = "#111111"
theme.fg_urgent = "#000000"
theme.bg_urgent = "#FFF"
theme.border_normal = "#141414"
theme.border_focus = "#93B6FF"
theme.taglist_fg_focus = "#FFFFFF"
theme.taglist_bg_focus = "#111111"
theme.taglist_bg_normal = "#111111"
theme.titlebar_bg_normal = "#191919"
theme.titlebar_bg_focus = "#262626"


--------------------------------------------------------------------------------
-- Geometry
--------------------------------------------------------------------------------

theme.menu_height = dpi(26)
theme.menu_width = dpi(130)
theme.border_width = dpi(1)


--------------------------------------------------------------------------------
-- Wibar
--------------------------------------------------------------------------------

theme.wibar = {}
theme.wibar.launcher = {}

theme.wibar.launcher.margin = {
    left  = 1, top    = 2,
    right = 1, bottom = 2,
}

theme.wibar.task_icons = {}
theme.wibar.task_icons.forced_width = 32
theme.wibar.task_icons.margin = {
    left=6, right=6,
}


--------------------------------------------------------------------------------
-- Notifications
--------------------------------------------------------------------------------

theme.notification_font = 'MesloLG M 12'
theme.notification_icon_size = 64;


return theme
