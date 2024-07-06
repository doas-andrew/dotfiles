--------------------------------------------------------------------------------
-- Wibar

if my.active_tags_only then
    -- Eminent-like task filtering
    local orig_filter = awful.widget.taglist.filter.all

    -- Taglist label functions
    awful.widget.taglist.filter.all = function(t, args)
        if t.selected or #t:clients() > 0 then
            return orig_filter(t, args)
        end
    end
end

awful.screen.connect_for_each_screen(function(s)
    fn.set_wallpaper(s)
    s.padding = theme.screen_padding
    s.myMaxCount = 0

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[layout_idx])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

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
            fg = theme.fg_normal,
            bg = theme.bg_normal,
        }
    }
    my_clock = {
        left = theme.wibar.clock.margin.left,
        right = theme.wibar.clock.margin.right,
        widget = wibox.container.margin,
        my_clock,
    }

    -- Taglist
    s.myTagList = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = gears.table.join(
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({ metakey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({ metakey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end)
        )
    }

    -- Tasklist
    local my_tasklist = require("lua.tasklist")(s)

    -- MPD
    local my_mpd = require("lua.mpd")(s)

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
                s.myTagList,
                my_tasklist,
                s.mypromptbox,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                my_mpd,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                -- awful.widget.keyboardlayout(),
                wibox.widget.systray(),
                my_clock,
                my_layouts,
            },
        },
    }
end)
