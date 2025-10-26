return { -- https://lazy.folke.io

    ----------------------------------------------------------------------------
    -- General
    ----------------------------------------------------------------------------
    {
        "lambdalisue/suda.vim",
    },
    {
        enabled = false,
        "mg979/vim-visual-multi",
        event = "BufEnter",
    },
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        event = "BufEnter",
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        -- Easymotion
        "phaazon/hop.nvim",
        event = "BufEnter",
        config = {
            keys = my.easymotion_keys,
        },
    },
    {
        "ahmedkhalf/project.nvim",
        name = "project_nvim",
        config = true,
    },
    {
        "NMAC427/guess-indent.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        enabled = false,
        "numToStr/Comment.nvim",
        config = function()
            _G.Comment = require("Comment.api")
        end,
    },


    ----------------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------------
    {
        enabled = false,
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    {
        -- Notification system for neovim
        enabled = false,
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },
    {
        -- Adds background color to hex codes
        "norcalli/nvim-colorizer.lua",
        init = function()
            require("colorizer").setup()
        end,
    },
    {
        enabled = false,
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = true,
    },


    ----------------------------------------------------------------------------
    -- Git
    ----------------------------------------------------------------------------
    {
        -- View additions, deletions, changes
        enabled = false,
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        config = true,
    },
    {
        -- Diff UI
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
    },
    {
        -- Get URLs for specific lines of code
        "ruifm/gitlinker.nvim",
        keys = { "<leader>gy" },
        config = true,
    },


    ----------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------
    -- {
    --     "LnL7/vim-nix",
    --     ft = "nix",
    -- },
    -- {
    --     "alaviss/nim.nvim",
    --     ft = "nim",
    -- },
    -- {
    --     "prisma/vim-prisma",
    --     ft = "prisma",
    -- },
    {
        -- Tooltips for function signatures
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            hint_enable = false,
        },
    },
    {
        -- Panel for LSP errors/warnings
        enabled = false,
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = {
            action_keys = {
                previous = "i",
                next = "k",
            },
        },
    },


    ----------------------------------------------------------------------------
    -- Themes
    ----------------------------------------------------------------------------
    { "rebelot/kanagawa.nvim" },
    { "navarasu/onedark.nvim" },
    { "projekt0n/github-nvim-theme" },
    {
        "sainnhe/gruvbox-material",
        init = function()
            -- material, mix, original (washed out -> vivid)
            vim.g.gruvbox_material_palette = "mix"
            vim.g.gruvbox_material_better_performance = 1
        end
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = {
            filter = "octagon",
            background_clear = {
                "telescope",
            },
        },
    },
}
