local banner = require("core.banners")[my.st_header]

return {
    {
        enabled = false,
        "echasnovski/mini.comment",
        version = "*",
        lazy = false,
        config = function()
            _G.MiniComment = require("mini.comment")
        end,
    },
    {
        enabled = false,
        "echasnovski/mini.surround",
        version = "*",
        lazy = false,
        config = function()
            _G.MiniSurround = require("mini.surround")
        end,
    },
    {
        enabled = false,
        "echasnovski/mini.tabline",
        version = "*",
        lazy = false,
        config = true,
    },
    {
        enabled = false,
        "echasnovski/mini.indentscope",
        version = "*",
        lazy = false,
        config = true,
    },
    {
        enabled = false,
        "echasnovski/mini.pairs",
        version = "*",
        event = "InsertEnter",
        config = true,
    },
    {
        "echasnovski/mini.sessions",
        version = "*",
        lazy = false,
        config = true,
    },
    {
        "echasnovski/mini.starter",
        version = "*",
        event = "VimEnter",
        config = function()
            _G.MiniStarter = require("mini.starter")
            MiniStarter.setup {
                silent = true,
                header = table.concat(banner, "\n") .. "\n",
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

                    MiniStarter.sections.sessions(6, false),
                    MiniStarter.sections.recent_files(6, false),
                }
            }
            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniStarterOpened",
                callback = function()
                    vim.keymap.del('n', '<M-j>', { buffer = true })
                    vim.keymap.del('n', '<M-k>', { buffer = true })

                    vim.keymap.set('n', '<M-i>', function()
                        MiniStarter.update_current_item('prev')
                    end, { buffer = true })

                    vim.keymap.set('n', '<M-k>', function()
                        MiniStarter.update_current_item('next')
                    end, { buffer = true })
                end,
            })
        end,
    }
}
