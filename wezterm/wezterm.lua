local wezterm = require 'wezterm'
local fn = require 'library'
local act = wezterm.action
local acb = wezterm.action_callback
local config = {}

-- Newer versions of wezterm use config_builder,
-- which provides better error messages.
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.set_environment_variables = {
    MY_WEZTERM_INDICATOR = '1'
}

-- https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Gruvbox dark, medium (base16)'

--- Monokai Pro
-- config.color_scheme = 'Monokai Pro (Gogh)'
-- config.colors = { background = '#2D2A2E' }
-- config.colors = { background = '#282A3A' }

-- Kanagawa
config.color_scheme = 'Kanagawa (Gogh)'
config.colors = {
    selection_bg = '#2D4F67',
    selection_fg = '#C8C093',
    tab_bar = {
        background = '#1F1F28',
        active_tab = {
            bg_color = '#C0A36E',
            fg_color = '#1F1F28',
        },
        inactive_tab = {
            bg_color = '#1F1F28',
            fg_color = '#DCD7BA',
        },
        new_tab = {
            bg_color = '#1F1F28',
            fg_color = '#DCD7BA',
        },
    },
}

-- config.font = wezterm.font 'MesloLGL Nerd Font Mono'
config.font_size = 12
config.line_height = 1

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false
config.status_update_interval = 1000

-- config.window_decorations = 'RESIZE'

config.window_padding = {
  left   = 10,
  right  = 10,
  top    = 10,
  bottom =  0,
}
config.leader = {
    mods = 'ALT',
    key = 'q',
    timeout_milliseconds = 2000,
}
-- https://wezfurlong.org/wezterm/config/lua/keyassignment/index.html
config.keys = {
    fn.ignore_editor {
        mods = 'ALT', key = 's',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'u',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'i',
        action = act.ActivatePaneDirection 'Up'
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'k',
        action = act.ActivatePaneDirection 'Down'
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'j',
        action = act.ActivatePaneDirection 'Left'
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'l',
        action = act.ActivatePaneDirection 'Right'
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'J',
        action = act.MoveTabRelative(-1)
    },
    fn.ignore_editor {
        mods = 'ALT', key = 'L',
        action = act.MoveTabRelative(1)
    },
    fn.editor_only {
        mods = 'CTRL', key = 'i',
        action = act.Multiple {
            act.SendKey { mods = 'CTRL', key = 'b' },
            act.SendKey { key = 'i' },
        },
    },
    {
        mods = 'CTRL', key = 't',
        action = act.SpawnTab('CurrentPaneDomain'),
    },
    fn.ignore_editor {
        mods = 'CTRL', key = 'j',
        action = act.ActivateTabRelative(-1)
    },
    fn.ignore_editor {
        mods = 'CTRL', key = 'l',
        action = act.ActivateTabRelative(1)
    },
    fn.ignore_editor {
        mods = 'CTRL', key = 'v',
        action = act.PasteFrom 'Clipboard'
    },
    fn.ignore_editor {
        mods = 'SHIFT', key = 'LeftArrow',
        action = act.AdjustPaneSize { 'Left', 5 }
    },
    fn.ignore_editor {
        mods = 'SHIFT', key = 'RightArrow',
        action = act.AdjustPaneSize { 'Right', 5 }
    },
    fn.ignore_editor {
        mods = 'SHIFT', key = 'DownArrow',
        action = act.AdjustPaneSize { 'Down', 5 }
    },
    fn.ignore_editor {
        mods = 'SHIFT', key = 'UpArrow',
        action = act.AdjustPaneSize { 'Up', 5 }
    },
    {
        mods = 'LEADER', key = 'd',
        action = act.ShowDebugOverlay
    },
    {
        mods = 'LEADER', key = 'i',
        action = acb(function(win, pane)
            -- tail -f $XDG_RUNTIME_DIR/wezterm/wezterm-gui-log-
            wezterm.log_info(
                '\nWindowID:', win:window_id(),
                '\nPaneID:', pane:pane_id(),
                '\nMuxTab:', pane:tab()
            )
        end),
    },
    {
        mods = 'LEADER', key = 'p',
        action = act.ActivateCommandPalette
    },
    {
        mods = 'LEADER', key = 'x',
        action = act.CloseCurrentPane { confirm = true }
    },
    {
        mods = 'LEADER|ALT', key = 's',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER|ALT', key = 'u',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods = 'LEADER|CTRL', key = 'j',
        action = act.ActivateTabRelative(-1)
    },
    {
        mods = 'LEADER|CTRL', key = 'l',
        action = act.ActivateTabRelative(1)
    },
}

config.key_tables = {
    copy_mode_temp = {
        {
            key = 'w',
            action = act.CopyMode 'MoveForwardWord'
        },
    },
}

-- leader + number to activate that tab
for i = 0, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'ALT',
        action = act.ActivateTab(i-1),
    })
end

wezterm.on('update-right-status', function(win, _)
    local prefix = ''

    if win:leader_is_active() then
        prefix = ' ' .. '⚡' .. ' '
    end

    win:set_left_status(wezterm.format {
        { Text = prefix },
    })
end)

return config
