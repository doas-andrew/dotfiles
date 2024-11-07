--------------------------------------------------------------------------------
-- All clients pass through this

client.connect_signal("manage", function(c)
    if not c.maximized and not c.fullscreen then
        c.shape = theme.window_shape
    end

    --  c:struts {
        --  top    = 0,
        --  left   = 0,
        --  right  = 0,
        --  bottom = 0,
    --  }
end)


--------------------------------------------------------------------------------
-- Reset wallpaper when a screen's geometry changes resolution

screen.connect_signal("property::geometry", fn.set_wallpaper)


--------------------------------------------------------------------------------
-- Focus client on mouse hover

if my.focus_mouse then
    client.connect_signal("mouse::enter", function(c)
        -- c:emit_signal("request::activate", "mouse_enter", {raise = false})
        c:emit_signal("request::activate")
    end)
end


--------------------------------------------------------------------------------
-- Client borders

if theme.border_width > 0 then
    client.connect_signal("focus", function(c)
        c.border_color = theme.border_focus
    end)

    client.connect_signal("unfocus", function(c)
        c.border_color = theme.border_normal
    end)

    client.connect_signal("manage", function(c)
        c.border_width = c.maximized and 0 or theme.border_width
    end)
end


--------------------------------------------------------------------------------
-- Wibox

client.connect_signal("focus", function(c)
    --  fn.dump(c.class.." focused")

    c.screen.mywibox.ontop = not c.fullscreen
end)

client.connect_signal("unfocus", function(c)
    --  fn.dump(c.class.." UNfocused")

    if theme.useless_gap > 0 and
        c.screen.selected_tag and
        not fn.s_floating(c)
    then
        c.maximized = false
        c.fullscreen = false
    end
end)

client.connect_signal("property::fullscreen", function(c)
    c.screen.mywibox.ontop = not c.fullscreen

    if not c.maximized then
        fn.toggle_border(c)
        fn.track_defloat(c.screen, c.fullscreen)
    end
end)

client.connect_signal("property::maximized", function(c)
    --  fn.dump(c.class..(c.maximized and " " or " UN").."maximized")

    if not c.fullscreen then
        fn.toggle_border(c)
        fn.track_defloat(c.screen, c.maximized)
    end
end)

client.connect_signal("property::minimized", function(c)
    if c.maximized or c.fullscreen then
        fn.track_defloat(c.screen, not c.minimized)
    end
end)

client.connect_signal("unmanage", function(c)
    if c.maximized or c.fullscreen then
        fn.track_defloat(c.screen, false)
    end
end)


--------------------------------------------------------------------------------
-- Add a titlebar if titlebars_enabled is set to true in the rules.

client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
    awful.titlebar(c):setup {
        layout = wibox.layout.align.horizontal,
        {   -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },{ -- Middle
            {   -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },{ -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal(),
        },
    }
end)


--------------------------------------------------------------------------------
-- Show system tray only on active screen's wibar

local last = awful.screen.focused()

client.connect_signal("focus", function(c)
    if last ~= c.screen then
        last = c.screen
        wibox.widget.systray():set_screen(c.screen)
    end
end)

