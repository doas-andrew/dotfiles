local launch_cmd = nil
local clip_cmd = nil

if my.launcher == "rofi" then
    launch_cmd = "rofi -show drun -monitor -2"
elseif my.launcher == "ulauncher" then
    launch_cmd = "ulauncher-toggle"
end

if my.clipman == "clipcat" then
    clip_cmd = "clipcat-menu"
elseif my.clipman == "greenclip" then
    clip_cmd = "rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"
end

local global_keys = gears.table.join(
    awful.key({ metakey }, "h", show_hotkeys,
        {description="show help", group="awesome"}
    ),
    awful.key({ metakey }, "Left", awful.tag.viewprev,
        {description = "view previous", group = "tag"}
    ),
    awful.key({ metakey }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ metakey }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"})

    , awful.key({ metakey }, "w",
        function() my.menu:show() end,
        { description = "show main menu", group = "awesome" }),

    -- Layout manipulation
    awful.key({ metakey, "Shift" }, "j",
        function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),

    awful.key({ metakey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ metakey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ metakey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ metakey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"})

    --  , awful.key({ altkey }, "Tab",
        --  function()
            --  switcher.switch(1, "Mod1", "Alt_L", "Shift", "Tab")
        --  end,
        --  { description = "focus next by index", group = "client" })

    -- , awful.key({ altkey, "Shift" }, "Tab",
        -- function()
            -- switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab")
        -- end,
        -- { description = "focus next by index", group = "client" })

    -- , awful.key({ altkey }, "`",
        -- function()
            -- if client.focus then
                -- client.focus.fullscreen = false
            -- end
            -- awful.client.focus.byidx(-1)
        -- end,
        -- { description = "focus previous by index", group = "client" })

    , awful.key({ altkey }, "Back",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" })

    -- Standard program
    , awful.key({ metakey }, "Return",
        function() awful.spawn(my.terminal) end,
        { description = "open a terminal", group = "launcher" })

    , awful.key({ metakey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" })

    --  , awful.key({ metakey, "Control" }, "r",
        --  function() t
        --  end,
        --  { description = "reload awesome", group = "awesome" })

    , awful.key({ metakey }, "l", fn.inc_layout,
        --  function() awful.layout.inc(1) end,
        { description = "Toggle layouts", group = "awesome" })

    --  , awful.key({ metakey, "Shift" }, "l",
        --  function() awful.spawn("flameshot screen") end,
        --  { description = "quit awesome", group = "awesome" })

    , awful.key({ metakey, "Shift" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),

    --  awful.key({ metakey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              --  {description = "increase master width factor", group = "layout"}),
    --  awful.key({ metakey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              --  {description = "decrease master width factor", group = "layout"}),
    --  awful.key({ metakey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              --  {description = "increase the number of master clients", group = "layout"}),
    --  awful.key({ metakey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              --  {description = "decrease the number of master clients", group = "layout"}),
    --  awful.key({ metakey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              --  {description = "increase the number of columns", group = "layout"}),
    --  awful.key({ metakey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              --  {description = "decrease the number of columns", group = "layout"}),
    --  awful.key({ metakey,           }, "space", function () awful.layout.inc( 1)                end,
              --  {description = "select next", group = "layout"}),
    --  awful.key({ metakey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              --  {description = "select previous", group = "layout"}),

    --  awful.key({ metakey, "Control" }, "n",
              --  function ()
                  --  local c = awful.client.restore()
                  --  -- Focus restored client
                  --  if c then
                    --  c:emit_signal(
                        --  "request::activate", "key.unminimize", {raise = true}
                    --  )
                  --  end
              --  end,
              --  {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ metakey }, "r",
        function() awful.screen.focused().mypromptbox:run() end,
        { description = "run prompt", group = "launcher" }),

    awful.key({ metakey }, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" })

    --  , awful.key({ metakey }, "p",
            --  function() menubar.show() end,
        --  { description = "show the menubar", group = "launcher" })

    , awful.key({ metakey }, "q",
        function() awful.spawn.with_shell("sh ~/.config/rofi/shutdown/shutdown.sh") end,
        { description = "Logout menu", group = "launcher" })

    , awful.key({ metakey }, "s",
        function() awful.spawn.with_shell("flameshot gui") end,
        { description = "Screenshot", group = "launcher" })

    , awful.key({ metakey }, "d", fn.toggle_desktop,
        { description = "Toggle desktop view", group = "client" })

    , awful.key({ metakey }, "comma", fn.next_half,
        { description = "Move window to next half", group = "client" })

    , awful.key({ metakey }, "period", fn.next_third,
        { description = "Move window to next third", group = "client" })

    , awful.key({ altkey }, "space",
        function() awful.spawn.with_shell(launch_cmd) end,
        { description = "Application launcher", group = "launcher" })

    , awful.key({ metakey }, "space",
        function() awful.spawn.with_shell(clip_cmd) end,
        { description = "Clipboard history", group = "launcher" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    local key = "#"..(i+9)
    global_keys = gears.table.join(global_keys,
        awful.key({ metakey }, key,
            -- View tag only.
            function()
                local tag = awful.screen.focused().tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #"..i, group = "tag" }
        ),
        -- Toggle tag display.
        awful.key({ metakey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ metakey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ metakey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Set keys
root.keys(global_keys)

-- other
_G.ClientKeys = gears.table.join(
    awful.key({ metakey }, "a",
        function(c)
            -- c.maximized_horizontal = not c.maximized_horizontal
            -- c.maximized_vertical = not c.maximized_vertical
            c.maximized = not c.maximized
            --  c:raise()
        end,
        { description = "toggle maximize", group = "client" })

    , awful.key({ metakey, "Shift" }, "a",
        function(c)
            fn.next_full(c)
        end,
        { description = "Add space around", group = "client" })

    , awful.key({ metakey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" })

     , awful.key({ metakey, "Shift" }, "c",
         function(c) c:kill() end,
         { description = "close", group = "client" })

    , awful.key({ metakey, "Control" }, "space",
        function(c)
            c.floating = false
            c.maximized = false
            c.fullscreen = false
        end,
        { description = "toggle floating", group = "client" })

    --  , awful.key({ metakey, "Control" }, "Return",
        --  function(c) c:swap(awful.client.getmaster()) end,
        --  { description = "move to master", group = "client" })

    , awful.key({ metakey }, "i",
        function(c)
            fn.dump(c:geometry())
            fn.dump {
                type = c.type,
                role = c.role,
                class = c.class,
                screen = c.screen,
                instance = c.instance,
                floating = c.floating,
                ontop = c.ontop,
                maximized = c.maximized,
                max_vert = c.maximized_vertical,
                max_horz = c.maximized_horizontal,
            }
        end,
        { description = "Window Info", group = "client" })

    , awful.key({ metakey }, "o",
        function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" })

    , awful.key({ metakey }, "t",
        function (c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" })

    , awful.key({ metakey }, "m",
        function(c)
            c.minimized = true
        end,
        { description = "minimize", group = "client" })
)
