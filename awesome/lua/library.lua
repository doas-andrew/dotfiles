local M = {}

function M.next_full(c)  fn.next_x(c, 1, false) end
function M.next_half(c)  fn.next_x(c, 2, true) end
function M.next_third(c) fn.next_x(c, 3, true) end

function M.next_x(c, div, jump, recurse)
    c = c or client.focus
    if c == nil then return end
    local g = fn.next_x_geometry(c, div)

    if not fn.s_floating(c) then
        awful.layout.set(awful.layout.suit.floating)
    end

    if recurse
        or c.y ~= g.y
        or c.width ~= g.width
        or c.height ~= g.height
        or c.maximized or c.fullscreen
    then
        c.maximized = false
        c.fullscreen = false
        c.width = g.width
        c.height = g.height
        c.x = g.start_x
        c.y = g.y
    else
        if c.x > g.last_x then
            if jump then
                local next_screen = screen[c.screen.index + 1] or screen[1]

                if next_screen ~= c.screen then
                    c:move_to_screen(next_screen)
                    g = fn.next_x_geometry(c, div)
                end
            end
            c.x = g.start_x
        else
            c.x = c.x + g.next_x
        end
    end
end

function M.next_x_geometry(c, div)
    local s = c.screen.geometry
    local sp = theme.screen_padding
    local gap = theme.useless_gap * 2
    local bw = theme.border_width * 2
    local wi = theme.menu_height + theme.wibar_border_width
    local gaps = ((div-1) * gap) + (gap * 2)
    local width = math.floor((s.width - sp.left - sp.right - gaps - (bw * div)) / div)
    return {
        width = width,
        start_x = s.x + sp.left + gap,
        next_x = width + bw + gap,
        last_x = s.x + (width * (div-2)) + bw + sp.left + gaps,
        y = wi + gap + sp.top,
        height = s.height - wi - (gap * 2) - bw - sp.top - sp.bottom,
    }
end

local td_focus = nil
function M.toggle_desktop()
    if client.focus then
        td_focus = client.focus

        for _, c in ipairs(client.get()) do
            c.minimized = true
        end
    else
        for _, c in ipairs(client.get()) do
            c:emit_signal(
                "request::activate",
                "key.unminimize",
                { raise = true })
        end

        client.focus = td_focus or awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
        td_focus = nil
    end
end

function M.set_wallpaper(screen)
    if not theme.wallpaper then return end
    local typ = type(theme.wallpaper)

    if typ == "function" then
        theme.wallpaper(screen)
    elseif typ == "string" then
        if string.find(theme.wallpaper, "tile") then
            gears.wallpaper.tiled(theme.wallpaper, screen)
        else
            gears.wallpaper.maximized(theme.wallpaper, screen, true)
        end
    elseif typ == "table" then
        gears.wallpaper[theme.wallpaper[2]](theme.wallpaper[1], screen)
    else
        error("invalid theme wallpaper")
    end
end

function M.click_to_hide(widget, hide_fct, only_outside)
    only_outside = only_outside or false

    hide_fct = hide_fct or function(object)
        if only_outside and object == widget then
            return
        end
        widget.visible = false
    end

    local click_bind = awful.button({}, 1, hide_fct)

    local function manage_signals(w)
        if w.visible then
            awful.mouse.append_global_mousebinding(click_bind)
            client.connect_signal("button::press", hide_fct)
            wibox.connect_signal("button::press", hide_fct)
        else
            wibox.disconnect_signal("button::press", hide_fct)
            client.disconnect_signal("button::press", hide_fct)
            awful.mouse.remove_global_mousebinding(click_bind)
        end
    end

    -- when the widget is visible, we hide it on button press
    widget:connect_signal('property::visible', manage_signals)

    function widget.disconnect_click_to_hide()
        widget:disconnect_signal('property::visible', manage_signals)
    end
end

function M.default(tbl, key, default)
    if tbl[key] == nil then
        tbl[key] = default
    end
end

function M.s_floating(c)
    return c.screen.selected_tag.layout.name == "floating"
end

function M.round_rect(num)
    return function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, num)
    end
end

function M.inc_layout(num)
    awful.layout.inc(num or 1)

    --  --  TODO: Somehow cache/persist selected layout across reload, per tag
    --  --  TODO: Reset floating windows when exiting floating layout?
    --  local layouts = awful.layout.layouts
    --  num = num or 1

    --  layout_idx = layout_idx + num
    --  if layout_idx > #layouts then
        --  layout_idx = 1
    --  end

    --  awful.layout.inc(num)
    --  if awful.layout.layouts[layout_idx].name == "floating" then
        --  awful.screen.padding = theme.screen_padding
    --  else
        --  awful.screen.padding = nil
    --  end
end

function M.dump(...)
    local arg = ...
    local t = type(arg)
    local text = ""

    if t == "table" then
        for key, val in pairs(arg) do
            text = text..key.." = "..tostring(val).."\n"
        end

        if #text == 0 then
            text = "Empty"
        end
    elseif t == "nil" then
        text = "NIL"
    else
        text = tostring(arg)
    end

    naughty.notify { text=text, timeout=0 }
end

function M.toggle_border(c)
    if c.fullscreen or c.maximized then
        c.shape = nil
        c.border_width = 0
    else
        c.shape = theme.window_shape
        c.border_width = theme.border_width
    end
end

function M.track_defloat(s, increase)
    if not theme.wibar.defloat then
        return
    end

    if increase then
        s.myMaxCount = s.myMaxCount + 1
        if s.myMaxCount == 1 then
            s.padding = 0
            s.mywibox.shape = nil
            s.mywibox.border_width = 0
            s.mywibox.width = s.geometry.width
        end
    else
        s.myMaxCount = s.myMaxCount - 1
        if s.myMaxCount == 0 then
            s.padding = theme.screen_padding
            s.mywibox.shape = theme.wibar.shape
            s.mywibox.border_width = theme.wibar_border_width
            s.mywibox.width = s.geometry.width - theme.wibar.width_offset
        end
    end
end

return M
