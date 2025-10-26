_G.my = {
    ----------------------------------------------------------------------------
    --- Style
    ----------------------------------------------------------------------------

    -- Set color theme. Not all color schemes implement different themes.
    -- @value: string: light, dark
    color_theme = "dark",

    -- Set color scheme.
    -- @value: string: github_dark, gruvbox-material, kanagawa, monokai-pro,
    --                 onedark
    color_scheme = "kanagawa",

    -- ASCII art for header and footer
    -- @value: string?: nvim_block, nvim_sharp, nvim_roman
    start_menu_header = "nvim_sharp",

    ----------------------------------------------------------------------------
    --- General
    ----------------------------------------------------------------------------

    -- Use these keys for easymotion hints
    -- @value: string
    -- @default: etovxqpdygfblzhckisuran
    easymotion_keys = "asdf;lkjqwerpoiu",

    -- Enable mouse in Neovim
    -- @value: boolean
    enable_mouse = true,

    -- Milliseconds to wait for a keymap sequence to complete.
    -- @value: integer
    sequence_debounce = 400,

    -- NOT IMPLEMENTED
    -- Disable this when editing "big" files
    -- @value: boolean
    use_swapfile = false,

    -- Cache undo history and restore it to buffer on file load
    -- @value: boolean
    remember_undo_history = false,

    -- Number of screen lines to use for the command-line.
    -- Zero = hide when not in use
    -- @value: integer
    cmd_height = 1,

    -- Minimal number of screen lines to keep above and below the cursor.
    -- @value: integer
    scroll_off = 5,

    -- When on, lines longer than the width of the window will wrap and
    -- displaying continues on the next line.
    -- @value: boolean
    word_wrap = true,

    -- Enable code folding
    -- @value: boolean
    enable_folding = false,

    -- Hightlight text when yanked.
    -- Can be toggled.
    -- @value: boolean
    highlight_search = true,

    -- Hightlight text when yanked.
    -- @value: boolean
    highlight_yank = true,

    -- NOT IMPLEMENTED
    -- Format on save.
    -- @value: boolean
    format_on_save = true,

    ----------------------------------------------------------------------------
    -- Line and column display
    ----------------------------------------------------------------------------

    -- Absolute: Show line numbers.
    -- Relative: Show line numbers incrementing away from cursor's line.
    -- Hybrid: Show absolute line number for the cursor's line, otherwise relative.
    -- Off: Disable line numbers.
    -- @value: string: absolute, relative, hybrid, off
    line_numbers = "absolute",

    -- Highlight the line number that the cursor occupies..
    -- @value: boolean
    highlight_cursor_line_number = true,

    -- Highlight the line that the cursor occupies.
    -- @value: boolean
    highlight_cursor_line = false,

    -- Highlight the column that the cursor occupies.
    -- @value: boolean
    highlight_cursor_column = false,

    -- Column number for right margin. Useful for aligning text.
    -- @value: integer
    color_column = "81,101",

    ----------------------------------------------------------------------------
    -- Indentation
    ----------------------------------------------------------------------------

    -- Insert spaces instead of tabs
    -- @value: boolean
    insert_spaces = true,

    -- Number of spaces to use for each level of indentation
    -- @value: integer
    indent_size = 4,

    -- Number of spaces to render for a <Tab>
    -- @value: integer
    tab_size = 4,

    -- Show guidelines for nested blocks.
    -- @value: boolean
    indent_guides = false,

    ----------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------

    -- Enable Language Server Protocol
    -- @value: boolean
    lsp_enabled = true,

    -- LSP servers to enable
    -- @value: strings: lua_ls
    lsp_servers = { "lua_ls" },
    -- lsp_servers = { "lua_ls", "pylsp", "gopls", "nimls" },

    -- Enable inline diagnostic text
    -- @value: boolean
    lsp_diag_inline = true,

    -- Enable showing diagnostic text in floating windows
    -- @value: boolean
    lsp_diag_windows = false,

    -- Only underline code for this severity level or higher
    -- @value: string: HINT < INFO < WARN < ERROR < DISABLE
    -- @default: hint
    lsp_underline_severity = "hint",

    -- NOT IMPLEMENTED
    -- Milliseconds to wait before LSP updates
    -- @value: integer
    -- @default: 150
    lsp_debounce = 300,

    -- Number of items shown in autocomplete suggestions
    -- @value: integer
    completion_items = 10,

    -- Width of LSP window
    -- @value: string: single, double
    lsp_window_border = "single",
}
