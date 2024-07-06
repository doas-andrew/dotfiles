my.menu = awful.menu {
    items = {
        { "hotkeys", function() show_hotkeys(nil, awful.screen.focused()) end },
        { "terminal", my.terminal },
        { "manual", my.terminal .. " -e man awesome" },
        { "edit config", my.terminal .. " -e " .. my.editor .. " " .. awesome.conffile },
        { "restart", awesome.restart },
        { "quit", function() awesome.quit() end },
    }
}

fn.click_to_hide(my.menu, function() my.menu:hide() end)
