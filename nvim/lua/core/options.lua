--------------------------------------------------------------------------------
-- Display

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.background = my.color_theme
vim.opt.cmdheight = my.cmd_height
vim.opt.scrolloff = my.scroll_off
vim.opt.laststatus = 3
vim.opt.signcolumn = "yes"
vim.opt.showbreak = "↪ "
vim.opt.showtabline = 2
vim.opt.title = true
vim.opt.numberwidth = 1
vim.opt.fileencoding = "utf-8"

if vim.g.neovide then
    vim.o.guifont = "MesloLGS NF:h11:#h-full"
    --  vim.g.neovide_cursor_animation_length = 0.08
    vim.g.neovide_cursor_animation_length = 0
end

-- Prompt user before doing destructive things
vim.opt.confirm = true


--------------------------------------------------------------------------------
-- Line display

vim.opt.cursorcolumn = my.highlight_cursor_column
vim.opt.linespace = 0

if my.line_numbers == "absolute" then
    vim.opt.number = true
elseif my.line_numbers == "relative" then
    vim.opt.relativenumber = true
elseif my.line_numbers == "hybrid" then
    vim.opt.number = true
    vim.opt.relativenumber = true
end

if my.highlight_cursor_line_number and
    my.highlight_cursor_line
then
    vim.opt.cursorline = true
elseif my.highlight_cursor_line_number then
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "number"
elseif my.highlight_cursor_line then
    vim.opt.cursorline = true
    vim.opt.cursorlineopt = "line"
end


--------------------------------------------------------------------------------
-- List chars

vim.opt.list = true
vim.opt.listchars = {
    --  eol = "↴",
    --  space = "•",
    --  tab = "» ",
    extends = "❯",
    nbsp = "_",
    precedes = "❮",
    tab = "  ",
    trail = "•",
}


--------------------------------------------------------------------------------
-- Indentation

vim.opt.wrap = my.word_wrap
vim.opt.expandtab = my.insert_spaces
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.shiftwidth = my.indent_size
vim.opt.softtabstop = my.tab_size
vim.opt.tabstop = my.tab_size


--------------------------------------------------------------------------------
-- Search and completion

vim.opt.hlsearch = my.highlight_search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.opt.pumheight = my.completion_items
vim.opt.completeopt = "menuone,noinsert,noselect"


--------------------------------------------------------------------------------
-- Folds

vim.opt.foldenable = my.enable_folding

--  if vim.opt.foldenable then
    --  vim.opt.foldlevelstart = 3
    --  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    --  vim.opt.foldmethod = "marker"
    --  vim.opt.foldmethod = "expr" -- This is kinda buggy
--  end


--------------------------------------------------------------------------------
-- Backup and swap

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = my.remember_undo_history
vim.opt.swapfile = false

-- This controls the delay for both swapfile writes and CursorHold events
vim.opt.updatetime = 200


--------------------------------------------------------------------------------
-- Other

vim.opt.timeoutlen = my.sequence_debounce
vim.opt.clipboard = "unnamedplus"

if my.enable_mouse then
    vim.opt.mouse = "a"
end
