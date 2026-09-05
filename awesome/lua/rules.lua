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
            callback = function(cli)
                if awesome.startup then
                    -- Prevent clients from being unreachable after screen count changes.
                    awful.placement.no_offscreen(cli)

                elseif not cli.maximized and fn.s_floating(cli) then
                    if my.always_start_maximized then
                        cli.maximized = true
                    else
                        fn.next_full(cli)
                    end
                end
            end
        }
    },{
        name = "Dialogs",
        rule_any = {
            role = {
                "GtkFileChooserDialog",
            },
            type = {
                "dialog",
            },
            class = {
                "GParted",
                "flameshot",
                "Mullvad VPN",
                "Pavucontrol",
            },
        },
        properties = {
            floating = true,
            maximized = false,
            callback = false,
            placement = awful.placement.centered,
        },
    },{

        name = "Dialogs",
        rule_any = {
            role = {
                "GtkFileChooserDialog",
            },
            type = {
                "dialog",
            },
            class = {
                ".blueman-manager-wrapped",
                "Pavucontrol",
            },
        },
        properties = {
            titlebars_enabled = true,
        },
    },
}
