return {
    "folke/snacks.nvim",
    opts = {
        bigfile = {
            enabled = true,
        },
        explorer = {
            enabled = true,
        },
        git = {
            enabled = true,
        },
        gitbrowse = {
            enabled = true,
        },
        indent = {
            enabled = my.indent_guides,
        },
        notifier = {
            enabled = true,
        },
        picker = {
            enabled = true,
            win = {
                preview = { minimal = true },
                input = {
                    keys = {
                        ["<Esc>"] = { "close",            mode = { "i", "n" }},
                        ["<M-I>"] = { "history_back",     mode = { "i", "n" }},
                        ["<M-K>"] = { "history_forward",  mode = { "i", "n" }},
                        ["<M-i>"] = { "list_up",          mode = { "i", "n" }},
                        ["<M-k>"] = { "list_down",        mode = { "i", "n" }},
                        ["i"] = "list_up",
                        ["k"] = "list_down",
                    },
                },
            },
        },
        quickfile = {
            enabled = true,
        },
        scroll = {
            enabled = true,
            animate = {
                duration = { total = 150 },
            },
        },
        statuscolumn = {
            enabled = true,
        },
        toggle = {
            enabled = true,
        },
        words = {
            enabled = false,
        },
    },
}
