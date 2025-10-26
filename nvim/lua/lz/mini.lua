local header = require("core.banners")[my.start_menu_header]
if header then header = table.concat(header, "\n") end

return {
    {
        -- enabled = false,
        "nvim-mini/mini.comment",
        version = "*",
        config = function()
            _G.MiniComment = require("mini.comment")
        end,
    },
    {
        enabled = false,
        "nvim-mini/mini.tabline",
        version = "*",
        config = true,
    },
    {
        enabled = false,
        "nvim-mini/mini.indentscope",
        version = "*",
        config = true,
    },
    {
        enabled = false,
        "nvim-mini/mini.pairs",
        version = "*",
        event = "InsertEnter",
        config = true,
    },
    {
        "nvim-mini/mini.surround",
        version = "*",
        opts = {
            -- mappings = {
            --     add = "sa",        -- Add surrounding in Normal and Visual modes
            --     delete = "sd",     -- Delete surrounding
            --     find = "sf",       -- Find surrounding (to the right)
            --     find_left = "sF",  -- Find surrounding (to the left)
            --     highlight = "sh",  -- Highlight surrounding
            --     replace = "sr",    -- Replace surrounding
            --     suffix_last = "l", -- Suffix to search with "prev" method
            --     suffix_next = "n", -- Suffix to search with "next" method
            -- },
        },
    },
    {
        "nvim-mini/mini.sessions",
        version = "*",
        config = true,
    },
    {
        "nvim-mini/mini.starter",
        version = "*",
        event = "VimEnter",
        config = function()
            local starter = require("mini.starter")
            starter.setup {
                silent = true,
                header = header,
                footer = "",
                items = {
                    -- { section = "Bookmarks", name = "Alacritty", action = "edit ~/.config/alacritty/alacritty.toml" },
                    { section = "Bookmarks", name = "Awesome",   action = "edit ~/.config/awesome/lua/config.lua" },
                    { section = "Bookmarks", name = "Emacs",     action = "edit ~/.config/emacs/init.el" },
                    { section = "Bookmarks", name = "Espanso",   action = "edit ~/.config/espanso/match/base.yml" },
                    { section = "Bookmarks", name = "Helix",     action = "edit ~/.config/helix/config.toml" },
                    { section = "Bookmarks", name = "NixOS",     action = "edit ~/dotfiles/nixos/packages.nix" },
                    { section = "Bookmarks", name = "WezTerm",   action = "edit ~/.config/wezterm/wezterm.lua" },
                    -- { section = "Bookmarks", name = "Tmux",      action = "edit ~/.config/tmux/tmux.conf" },
                    { section = "Bookmarks", name = "Zsh",       action = "edit ~/.zshrc" },

                    { section = "Neovim",    name = "Config",    action = "edit ~/.config/nvim/lua/core/config.lua" },
                    { section = "Neovim",    name = "Keys",      action = "edit ~/.config/nvim/lua/core/keymaps.lua" },
                    { section = "Neovim",    name = "Packages",  action = "edit ~/.config/nvim/lua/lz/init.lua" },

                    starter.sections.sessions(6, false),
                    starter.sections.recent_files(6, false),
                }
            }
            fn.autocmd("User", "MiniStarterOpened", function()
                vim.keymap.del('n', '<M-j>', { buffer = true })
                vim.keymap.del('n', '<M-k>', { buffer = true })

                vim.keymap.set('n', '<M-i>', function()
                    starter.update_current_item('prev')
                end, { buffer = true })

                vim.keymap.set('n', '<M-k>', function()
                    starter.update_current_item('next')
                end, { buffer = true })
            end)
        end,
    }
}
