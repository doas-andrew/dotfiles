local map_names = {
    ["org.wezfurlong.wezterm"] = "wezterm",
}

local function set_task_markup(self, cli)
    local text_w = self:get_children_by_id("custom_text")[1]
    local text = map_names[cli.class] or cli.class or "???"
    local fg

    if cli == client.focus then
        fg = theme.tasklist_fg_focus
    else
        fg = theme.tasklist_fg_normal
    end

    text_w.markup = string.format(
        [[<span foreground="%s">%s</span>]],
        fg,
        awful.util.escape(text)
    )
end

return function(scrn)
    local tasklist = awful.widget.tasklist {
        screen = scrn,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.table.join(
            awful.button({}, 1, function(cli)
                if cli == client.focus then
                    cli.minimized = true
                else
                    cli:emit_signal("request::activate", "tasklist", { raise = true })
                end
            end),

            awful.button({}, 2, function(cli)
                cli:kill()
            end),

            awful.button({}, 3, function()
                awful.menu.client_list({ theme = { width = 250 } })
            end),

            awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({}, 5, function() awful.client.focus.byidx(1) end)
        ),
        style = {
            shape = theme.tasklist_shape,
            shape_border_color = theme.tasklist_border,
            shape_border_width = theme.tasklist_border_width,
            spacing = theme.tasklist_spacing,
        },
        layout = {
            layout = wibox.layout.fixed.horizontal,
        },
        widget_template = {
            {
                {
                    id = "custom_text",
                    widget = wibox.widget.textbox,
                    font = theme.tasklist_font,
                },
                left = theme.tasklist_margin.left,
                right = theme.tasklist_margin.right,
                top = theme.tasklist_margin.top,
                bottom = theme.tasklist_margin.bottom,
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,

            create_callback = function(self, cli, _, _)
                set_task_markup(self, cli)
            end,

            update_callback = function(self, cli, _, _)
                set_task_markup(self, cli)
            end,
        },
    }

    return {
        tasklist,
        halign = "center",
        widget = wibox.container.place,
    }
end
