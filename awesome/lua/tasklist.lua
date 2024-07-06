local func

if my.tasklist == "icons" then
    func = function(s)
        s.mytasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = gears.table.join(
                awful.button({}, 1, function (c)
                    if c == client.focus then
                        c.minimized = true
                    else
                        c:emit_signal(
                            "request::activate",
                            "tasklist",
                            { raise = true }
                        )
                    end
                end),

                awful.button({}, 3, function()
                    awful.menu.client_list({ theme = { width = 250 } })
                end),

                awful.button({}, 4, function ()
                    awful.client.focus.byidx(1)
                end),

                awful.button({}, 5, function ()
                    awful.client.focus.byidx(-1)
                end)
            ),
            style = {
                border_width = 40,
                bg_focus = "#353535",
                --  bg_normal = "#aaa",
                --  bg_minimize = "#fff",
            },
            widget_template = {
                id = 'background_role',
                widget = wibox.container.background,
                {
                    widget = wibox.container.place,
                    {
                        layout = wibox.layout.flex.horizontal,
                        {
                            top = theme.wibar.task_icons.margin.top,
                            bottom = theme.wibar.task_icons.margin.bottom,
                            left = theme.wibar.task_icons.margin.left,
                            right = theme.wibar.task_icons.margin.right,
                            forced_width = theme.wibar.task_icons.forced_width,
                            widget = wibox.container.margin,
                            {
                                id = 'icon_role',
                                widget = wibox.widget.imagebox,
                            },
                        }}}}}
        return {
            left = 10,
            right = 10,
            widget = wibox.container.margin,
            s.mytasklist,
        }
    end
elseif my.tasklist == "text" then
    func = function(s)
        s.mytasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.focused,
            buttons = gears.table.join(
                awful.button({}, 1, function()
                    awful.menu.client_list({ theme = { width = 250 } })
                end),

                awful.button({}, 3, function()
                    awful.menu.client_list({ theme = { width = 250 } })
                end),

                awful.button({}, 4, function ()
                    awful.client.focus.byidx(1)
                end),

                awful.button({}, 5, function ()
                    awful.client.focus.byidx(-1)
                end)
            ),
            style = {
                --  border_width = 40,
                fg_focus = theme.fg_normal,
                bg_focus = "#353535",
                shape = fn.round_rect(4),
            },
            widget_template = {
                width = 300,
                widget = wibox.container.constraint,
                {
                    top = 4,
                    bottom = 5,
                    left = 16,
                    right = 16,
                    widget = wibox.container.margin,
                    {
                        id = "background_role",
                        widget = wibox.container.background,
                        {
                            left = 8,
                            right = 8,
                            widget = wibox.container.margin,
                            {
                                id = "text_role",
                                widget = wibox.widget.textbox,
                                ellipsize = "middle",
                            },
                        },
                    },
                },

            },
        }
        return s.mytasklist
    end
end

return func or function()
    return nil
end
