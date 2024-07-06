return {
    ----------------------------------------------------------------------
    --- Config
    ----------------------------------------------------------------------

    -- Theme
    -- @value: String: square, rounded
    theme = "rounded",

    -- Layouts
    -- @value: String
    layouts = {
        "floating",
        --  "tile",
    },

    -- Defaults to $TERMINAL and then xterm
    -- @value: String
    terminal = nil,

    -- Defaults to $EDITOR and then nano
    -- @value: String
    editor = nil,

    -- Application launcher
    -- @value: String: rofi, ulauncher
    launcher = "rofi",

    -- Clipboard manager
    -- @value: String: clipcat, greenclip
    clipman = "greenclip",

    -- Always start windows maximized (except for dialogs or whatever)
    -- @value: Boolean
    always_start_maximized = true,

    -- Window buttons to minimize, fullscreen, close, etc
    -- @value: Boolean
    enable_titlebars = false,

    -- Only show workspaces (tags) that are in use
    -- @value: Boolean
    active_tags_only = true,

    -- Focus window on mouse hover ("sloppy focus")
    -- @value: Boolean
    focus_mouse = false,

    -- Show tasklist in wibar.
    -- @value: String: text, icons, nil
    tasklist = "text",

    -- Autostart mpd and show mpd status in wibar
    -- @value: Boolean
    using_mpd = false,

    -- Lock the screen after X seconds
    -- @value: Integer
     lock_delay = 900,

    -- Sleep after X more seconds
    -- @value: Integer
     sleep_delay = 1800,
}
