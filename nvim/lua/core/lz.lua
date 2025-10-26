-- Bootstrap lazy.nvim
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
    vim.fn.system {
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    }
end

-- Add lazy to the runtimepath so it can be required
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup("lz", {
    change_detection = { notify = false },
})
