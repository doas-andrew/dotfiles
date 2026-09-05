local make_taglist = require("lua.wibar.taglist")
local make_tasklist = require("lua.wibar.tasklist")
local make_mpd = require("lua.wibar.mpd")
local screen_temperature = require("lua.wibar.screen_temperature")

awful.screen.connect_for_each_screen(function(s)
    fn.set_wallpaper(s)
    s.padding = theme.screen_padding
    s.myMaxCount = 0

    -- Active layout
    local my_layouts = nil
    if #awful.layout.layouts > 1 then
        s.my_layouts = awful.widget.layoutbox(s)
        s.my_layouts:buttons(gears.table.join(
            awful.button({}, 1, function() fn.inc_layout( 1) end),
            awful.button({}, 3, function() fn.inc_layout(-1) end),
            awful.button({}, 4, function() fn.inc_layout( 1) end),
            awful.button({}, 5, function() fn.inc_layout(-1) end)))
        my_layouts = {
            left   = theme.wibar.layouts.margin.left,
            right  = theme.wibar.layouts.margin.right,
            top    = theme.wibar.layouts.margin.top,
            bottom = theme.wibar.layouts.margin.bottom,
            widget = wibox.container.margin,
            s.my_layouts,
        }
    end

    -- Launcher
    local my_launcher = {
        left   = theme.wibar.launcher.margin.left,
        right  = theme.wibar.launcher.margin.right,
        top    = theme.wibar.launcher.margin.top,
        bottom = theme.wibar.launcher.margin.bottom,
        widget = wibox.container.margin,
        awful.widget.launcher {
            image = theme.awesome_icon,
            menu = my.menu,
        }
    }

    -- Clock
    local my_clock = wibox.widget.textclock("%-I:%M %p")
    theme.cal = lain.widget.cal {
        attach_to = { my_clock },
        notification_preset = {
            position = "top_right",
            --  font = "Monospace 20",
            fg = theme.wibar_fg,
            bg = theme.wibar_bg,
        }
    }
    my_clock = {
        left = theme.wibar.clock.margin.left,
        right = theme.wibar.clock.margin.right,
        widget = wibox.container.margin,
        my_clock,
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = theme.wibar.position,
        ontop = false,
        expand = true,
        screen = s,
        height = theme.menu_height,
        width = s.geometry.width - theme.wibar.width_offset,
        shape = theme.wibar.shape,
    }

    -- Add widgets to the wibar
    s.mywibox:setup {
        left   = theme.wibar.margin.left,
        right  = theme.wibar.margin.right,
        top    = theme.wibar.margin.top,
        bottom = theme.wibar.margin.bottom,
        widget = wibox.container.margin,
        {
            expand = "none",
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                my_launcher,
                make_taglist(s),
                make_tasklist(s),
                awful.widget.prompt(),
            },
            {
                layout = wibox.layout.fixed.horizontal,
                make_mpd(s),
            },
            {
                layout = wibox.layout.fixed.horizontal,
                -- awful.widget.keyboardlayout(),
                wibox.widget.systray(),
                screen_temperature,
                my_clock,
                my_layouts,
            },
        },
    }
end)
