local function placement_check(c, func)
    if awesome.startup then
        -- Do nothing
    elseif fn.s_floating(c) then
        func(c)
    end
end

awful.rules.rules = {
    {
        name = "All clients",
        rule = {},
        properties = {
            raise = true,
            focus = awful.client.focus.filter,
            screen = awful.screen.preferred,
            keys = ClientKeys,
            titlebars_enabled = my.enable_titlebars,
            buttons = gears.table.join(
                awful.button({}, 1, function (c)
                    c:emit_signal("request::activate", "mouse_click", { raise = true })
                end),

                awful.button({ altkey }, 1, function (c)
                    c:emit_signal("request::activate", "mouse_click", { raise = true })
                    awful.mouse.client.move(c)
                end),

                awful.button({ altkey }, 3, function (c)
                    c:emit_signal("request::activate", "mouse_click", { raise = true })
                    awful.mouse.client.resize(c)
                end)
            ),
            callback = function(c)
                if awesome.startup then
                    -- Prevent clients from being unreachable after screen count changes.
                    awful.placement.no_offscreen(c)

                elseif not c.maximized and fn.s_floating(c) then
                    awful.placement.centered(c)
                    -- `placement.centered` does not account for the wibar,
                    -- so we'll handle the vertical positioning ourselves.
                    local g = fn.next_x_geometry(c, 1)
                    if c.y < g.y then
                        c.y = g.y
                    end
                end
            end
        }
    },{
        name = "Dialogs",
        rule_any = {
            type = { "dialog" },
            class = {
                "GParted",
                ".blueman-manager-wrapped",
                "Pavucontrol",
                "flameshot",
            },
        },
        properties = {
            floating = true,
            maximized = false,
            titlebars_enabled = true,
        },
    },{
        name = "Start maximized",
        rule_any = {
            class = {
                "Alacritty",
                "neovide",
                "Sublime_text",
            },
            instance = {
                "Navigator",
            },
        },
        callback = function(c)
            placement_check(c, function()
                if c.type ~= 'normal' then
                    -- Do nothing
                elseif my.always_start_maximized then
                    c.maximized = true
                elseif theme.useless_gap > 0 then
                    fn.next_full(c)
                else
                    c.maximized = true
                end
            end)
        end,
    },{
        name = "Start first half",
        rule_any = {
            instance = { "ymuse" },
        },
        callback = function(c)
            placement_check(c, fn.next_half)
        end,
    }
}
