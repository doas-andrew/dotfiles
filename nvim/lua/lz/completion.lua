return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Experimental. Doesn't appear on auto-completion. Use lsp_signature for now.
        -- signature = { enabled = true },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },

        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            ["<Tab>"] = { "accept", "fallback" },
            ["<Esc>"] = { "cancel", "fallback" },
            ["<M-i>"] = { "select_prev", "fallback" },
            ["<M-k>"] = { "select_next" , "fallback" },
        },
    },
    opts_extend = { "sources.default" }
}
