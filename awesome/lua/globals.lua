_G.awesome = awesome
_G.client = client
_G.screen = screen
_G.root = root
_G.widget = widget
_G.mpd_now = mpd_now

_G.awful = require("awful")
_G.gears = require("gears")
_G.naughty = require("naughty")
_G.wibox = require("wibox")

_G.lain = require("lain")
_G.markup = lain.util.markup

_G.altkey = "Mod1"
_G.metakey = "Mod4"
_G.layout_idx = 1
_G.CONFIG = awful.util.get_configuration_dir()

_G.show_hotkeys = require("awful.hotkeys_popup").show_help
_G.dpi = require("beautiful.xresources").apply_dpi

_G.fn = require("lua.library")----┒
_G.my = require("lua.variables")--┃
_G.theme = require("lua.theme")---┚
