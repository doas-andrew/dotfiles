local beautiful = require("beautiful")
local theme = require(string.format("lua.themes.%s", my.theme))


--------------------------------------------------------------------------------
-- Defaults
--------------------------------------------------------------------------------

local empty_margin = {
    left  = 0, top    = 0,
    right = 0, bottom = 0,
}

fn.default(theme, "useless_gap", 0)
fn.default(theme, "border_width", 0)
fn.default(theme, "wibar_border_width", 0)
fn.default(theme, "screen_padding", empty_margin)

fn.default(theme, "wibar", {})
fn.default(theme.wibar, "defloat", false)
fn.default(theme.wibar, "width_offset", 0)
fn.default(theme.wibar, "position", "top")
fn.default(theme.wibar, "margin", {})
fn.default(theme.wibar, "task_icon_margin", {})

fn.default(theme.wibar, "task_icons", {})
fn.default(theme.wibar.task_icons, "margin", {})

fn.default(theme.wibar, "launcher", {})
fn.default(theme.wibar.launcher, "margin", {})

fn.default(theme.wibar, "clock", {})
fn.default(theme.wibar.clock, "margin", {})

fn.default(theme.wibar, "layouts", {})
fn.default(theme.wibar.layouts, "margin", {})


--------------------------------------------------------------------------------
-- Icons
--------------------------------------------------------------------------------

theme.awesome_icon = theme.icons.."awesome.png"
--  theme.awesome_icon = theme.icons.."nixos.svg"
--  theme.awesome_icon = theme.icons.."nixos-solid.svg"
theme.menu_submenu_icon = theme.icons.."submenu.png"
theme.taglist_squares_sel = theme.icons.."square_unsel.png"
theme.taglist_squares_unsel = theme.icons.."square_unsel.png"
theme.vol = theme.icons.."vol.png"
theme.vol_low = theme.icons.."vol_low.png"
theme.vol_no = theme.icons.."vol_no.png"
theme.vol_mute = theme.icons.."vol_mute.png"
theme.disk = theme.icons.."disk.png"
theme.ac = theme.icons.."ac.png"
theme.bat = theme.icons.."bat.png"
theme.bat_low = theme.icons.."bat_low.png"
theme.bat_no = theme.icons.."bat_no.png"
theme.widget_cpu = theme.icons.."cpu.png"
theme.widget_temp = theme.icons.."temp.png"
theme.widget_mem = theme.icons.."mem.png"
theme.play = theme.icons.."play.png"
theme.pause = theme.icons.."pause.png"
theme.stop = theme.icons.."stop.png"

theme.layout_tile = theme.icons.."tile.png"
theme.layout_tileleft = theme.icons.."tileleft.png"
theme.layout_tilebottom = theme.icons.."tilebottom.png"
theme.layout_tiletop = theme.icons.."tiletop.png"
theme.layout_fairv = theme.icons.."fairv.png"
theme.layout_fairh = theme.icons.."fairh.png"
theme.layout_spiral = theme.icons.."spiral.png"
theme.layout_dwindle = theme.icons.."dwindle.png"
theme.layout_max = theme.icons.."max.png"
theme.layout_fullscreen = theme.icons.."fullscreen.png"
theme.layout_magnifier = theme.icons.."magnifier.png"
theme.layout_floating = theme.icons.."floating.png"

theme.titlebar_close_button_focus = theme.icons.."titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.icons.."titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.icons.."titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.icons.."titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.icons.."titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.icons.."titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.icons.."titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.icons.."titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.icons.."titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.icons.."titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.icons.."titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.icons.."titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.icons.."titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.icons.."titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.icons.."titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.icons.."titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.icons.."titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.icons.."titlebar/maximized_normal_inactive.png"

theme.layout_centerfair = theme.icons.."centerfair.png"
theme.layout_termfair = theme.icons.."termfair.png"
theme.layout_centerwork = theme.icons.."centerwork.png"

beautiful.init(theme)
return beautiful
