if my.active_tags_only then
    -- Eminent-like task filtering
    local orig_filter = awful.widget.taglist.filter.all

    -- Taglist label functions
    awful.widget.taglist.filter.all = function(tag, args)
        if tag.selected or #tag:clients() > 0 then
            return orig_filter(tag, args)
        end
    end
end

return function(scrn)
    -- Each screen has its own tag table.
    local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
    awful.tag(tags, scrn, awful.layout.layouts[layout_idx])

    return wibox.widget {
        awful.widget.taglist {
            screen  = scrn,
            filter  = awful.widget.taglist.filter.all,
            buttons = gears.table.join(
                awful.button({}, 1, function(tag) tag:view_only() end),
                awful.button({ metakey }, 1, function(tag)
                    if client.focus then
                        client.focus:move_to_tag(tag)
                    end
                end),

                awful.button({}, 3, awful.tag.viewtoggle),
                awful.button({ metakey }, 3, function(tag)
                    if client.focus then
                        client.focus:toggle_tag(tag)
                    end
                end),

                awful.button({}, 4, function(tag) awful.tag.viewprev(tag.screen) end),
                awful.button({}, 5, function(tag) awful.tag.viewnext(tag.screen) end)
            ),
            style = {
                bg_focus = theme.wibar_bg,
            },
        },
        left   = 6,
        right  = 12,
        widget = wibox.container.margin,
    }
end
