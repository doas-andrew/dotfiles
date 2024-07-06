local theme = {}
local assets_dir = CONFIG.."assets/"


--------------------------------------------------------------------------------
-- Assets
--------------------------------------------------------------------------------

theme.font = "Foobar Bold 9"
theme.icons = assets_dir.."icons/copland/"
theme.wallpaper = assets_dir.."wallpapers/ibm-warm.jpg"


--------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------

bg = "#000"

theme.fg_normal = "#BBBBBB"
theme.fg_focus = "#78A4FF"
theme.fg_urgent = "#000000"

theme.bg_normal = bg
theme.bg_focus = bg
theme.bg_urgent = "#990000"

theme.border_normal = "#141414"
theme.border_focus = "#a89984"
-- theme.border_focus = "#93B6FF"

theme.taglist_fg_focus = "#FFFFFF"
theme.taglist_bg_normal = bg
theme.taglist_bg_focus = bg

theme.titlebar_bg_normal = "#191919"
theme.titlebar_bg_focus = "#262626"


--------------------------------------------------------------------------------
-- Geometry
--------------------------------------------------------------------------------

theme.menu_height = dpi(28)
theme.menu_width = dpi(130)
theme.border_width = dpi(1)
theme.window_shape = fn.round_rect(10)
theme.useless_gap = 10
theme.wibar_border_width = dpi(4)

 -- theme.screen_padding = {
 --     left  = 8, top    = 0,
 --     right = 8, bottom = 4,
 -- }


--------------------------------------------------------------------------------
-- Wibar
--------------------------------------------------------------------------------

theme.wibar = {}
theme.wibar.layouts = {}
theme.wibar.launcher = {}
theme.wibar.task_icons = {}
theme.wibar.defloat = true

theme.wibar.shape = fn.round_rect(10)
theme.wibar.width_offset = theme.useless_gap * 4
theme.wibar.border_width = dpi(2)

theme.wibar.margin = {
    left  = 6, top    = 0,
    right = 3, bottom = 0,
}

theme.wibar.launcher.margin = {
    left  = 1, top    = 5,
    right = 2, bottom = 5,
}

theme.wibar.clock = {}
theme.wibar.clock.margin = {
    left = 10, right = 10
}

theme.wibar.layouts.margin = {
    left  = -4, top    = 2,
    right =  0, bottom = 2,
}

theme.wibar.task_icons.forced_width = 32
theme.wibar.task_icons.margin = {
    left=6, right=6,
}


--------------------------------------------------------------------------------
-- Notifications
--------------------------------------------------------------------------------

theme.notification_font = 'MesloLG M 12'
theme.notification_icon_size = 64
theme.notification_shape = fn.round_rect(8)


return theme
