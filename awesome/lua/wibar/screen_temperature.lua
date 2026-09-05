-- Circular indicator
local arc = wibox.widget {
    max_value     = my.max_screen_temp - my.min_screen_temp,
    value         = my.state.screen_temperature - my.min_screen_temp,
    thickness     = 2.5,
    start_angle   = 4.71238898, -- Start at the top (1.5 * pi)
    colors        = theme.wibar_fg,
    bg            = "#424242",
    forced_height = 18,
    forced_width  = 18,
    widget        = wibox.container.arcchart,
}

-- Central icon/text
local icon = wibox.widget {
    font = "Font Awesome 6 Free 12",
    text = "☀︎",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
}

local M = wibox.widget {
    arc,
    -- icon,
    layout = wibox.layout.stack,
}

local function set_temperature(temp)
    if temp < my.min_screen_temp then
        temp = my.min_screen_temp
    elseif temp > my.max_screen_temp then
        temp = my.max_screen_temp
    end

    if temp == my.state.screen_temperature then
        return
    end

    my.state.set("screen_temperature", temp)

    -- Redshift flag -P clears existing adjustments before applying a one-shot temperature (-O)
    awful.spawn.easy_async("redshift -P -O " .. tostring(temp), function(_, _, _, exit_code)
        if exit_code ~= 0 then
            naughty.notify({
                preset = naughty.config.presets.critical,
                title = "Color Temp Widget Error",
                text = "Failed to run redshift. Is it installed?",
            })
        end
    end)

    -- Update the circular bar
    arc.value = my.state.screen_temperature - my.min_screen_temp
end

-- Mouse bindings for scrolling
M:buttons(gears.table.join(
    -- Scroll up: Increase temperature (Cooler, more blue)
    awful.button({}, 4, function()
        set_temperature(my.state.screen_temperature + my.screen_temp_step)
    end),

    -- Scroll down: Decrease temperature (Warmer, more red)
    awful.button({}, 5, function()
        set_temperature(my.state.screen_temperature - my.screen_temp_step)
    end),

    -- Left click: Set to maximum temperature
    awful.button({}, 1, function ()
        set_temperature(my.max_screen_temp)
    end),

    -- Right click: Set to minimum temperature
    awful.button({}, 3, function ()
        set_temperature(my.min_screen_temp)
    end)
))

return M
