-- If LuaRocks is installed, ensure that packages installed through
-- it are found (IE: lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("lua.globals")
require("lua.autostart")
require("lua.menu")------┒
require("lua.layouts")---┃
require("lua.wibar")-----┚
require("lua.keys")---┒
require("lua.rules")--┚
require("lua.signals")
require("awful.autofocus")
require("lua.errors")
require("lua.after")
