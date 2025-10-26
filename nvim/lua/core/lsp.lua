if not my.lsp_enabled then return end

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        { ".luarc.json", ".luarc.jsonc" },
        ".git",
    },
})

for server in fn.values(my.lsp_servers) do
    vim.lsp.enable(server)
end

if my.lsp_diag_windows then
    fn.autocmd("CursorHold", "*", "lua vim.diagnostic.open_float()")
end

vim.diagnostic.severity["DISABLE"] = 0

vim.diagnostic.config {
	virtual_text = my.lsp_diag_inline and {},
    underline = {
        severity = { min = my.lsp_underline_severity },
    },
    float = {
        border = my.lsp_window_border,
    },
}
