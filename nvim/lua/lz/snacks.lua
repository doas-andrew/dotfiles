return {
    "folke/snacks.nvim",
    opts = {
        bigfile = { enabled = true },
        git = { enabled = true },
        gitbrowse = { enabled = true },
        indent = { enabled = my.indent_guides },
        notifier = { enabled = true },
        picker = {
            enabled = true,
            win = {
                preview = { minimal = true },
            },
        },
        quickfile = { enabled = true },
        scroll = {
            enabled = true,
            animate = {
                duration = { total = 150 },
            },
        },
        statuscolumn = { enabled = true },
        toggle = { enabled = true },
        words = { enabled = false },
    },
}
