--------------------------------------------------------------------------------
-- Maps
--------------------------------------------------------------------------------

local opts = { silent = false }
local map  = fn.make_map("",  opts)
local cmap = fn.make_map("c", { silent = false })
local imap = fn.make_map("i", opts)
local nmap = fn.make_map("n", opts)
local vmap = fn.make_map("v", opts)


--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------

-- local comment = require("Comment.api")
local multic = require("multicursor-nvim")
local sessions = require("mini.sessions")
local starter = require("mini.starter")
local surround = require("mini.surround")
local telescope = require("telescope.builtin")


--------------------------------------------------------------------------------
-- Environment
--------------------------------------------------------------------------------

if vim.g.neovide then
    nmap("<C-i>", "<C-u>", "Move up half a page")
    vmap("<C-i>", "<C-u>", "Move down half a page")
    cmap("<C-BS>", "<C-u>", "Delete all preceeding text")
    imap("<C-BS>", "<C-u>", "Delete all preceeding text")
else
    nmap("<C-b>i", "<C-u>", "Move up half a page")
    vmap("<C-b>i", "<C-u>", "Move down half a page")
    cmap("<C-h>", "<C-u>", "Delete all preceeding text")
    imap("<C-h>", "<C-u>", "Delete all preceeding text")
end

if fn.is_wezterm() then
    nmap("<M-i>", [[:lua fn.if_window_to_the('up',    'wincmd k', 'silent !wezterm cli activate-pane-direction up')<CR>]])
    nmap("<M-k>", [[:lua fn.if_window_to_the('down',  'wincmd j', 'silent !wezterm cli activate-pane-direction down')<CR>]])
    nmap("<M-j>", [[:lua fn.if_window_to_the('left',  'wincmd h', 'silent !wezterm cli activate-pane-direction left')<CR>]])
    nmap("<M-l>", [[:lua fn.if_window_to_the('right', 'wincmd l', 'silent !wezterm cli activate-pane-direction right')<CR>]])

    nmap("<C-j>", [[:lua fn.if_only_buffer('silent !wezterm cli activate-tab --tab-relative -1', 'BufferPrevious')<CR>]])
    nmap("<C-l>", [[:lua fn.if_only_buffer('silent !wezterm cli activate-tab --tab-relative  1', 'BufferNext')<CR>]])

    nmap("<M-J>", [[:BufferMovePrevious<CR>]])
    nmap("<M-L>", [[:BufferMoveNext<CR>]])
elseif fn.is_tmux() then
    nmap("<M-i>", [[:lua fn.if_window_to_the('up',    'wincmd k', 'silent !tmux select-pane -U')<CR>]])
    nmap("<M-k>", [[:lua fn.if_window_to_the('down',  'wincmd j', 'silent !tmux select-pane -D')<CR>]])
    nmap("<M-j>", [[:lua fn.if_window_to_the('left',  'wincmd h', 'silent !tmux select-pane -L')<CR>]])
    nmap("<M-l>", [[:lua fn.if_window_to_the('right', 'wincmd l', 'silent !tmux select-pane -R')<CR>]])

    nmap("<C-j>", [[:lua fn.if_only_buffer('silent !tmux select-window -p', 'BufferPrevious')<CR>]])
    nmap("<C-l>", [[:lua fn.if_only_buffer('silent !tmux select-window -n', 'BufferNext')<CR>]])

    nmap("<M-J>", [[:lua fn.if_only_buffer('silent !tmux swap-window -dt -1', 'BufferMovePrevious')<CR>]])
    nmap("<M-L>", [[:lua fn.if_only_buffer('silent !tmux swap-window -dt +1', 'BufferMoveNext')<CR>]])
else
    nmap("<M-i>", [[:wincmd k<CR>]])
    nmap("<M-k>", [[:wincmd j<CR>]])
    nmap("<M-j>", [[:wincmd h<CR>]])
    nmap("<M-l>", [[:wincmd l<CR>]])

    nmap("<C-j>", [[:BufferPrevious<CR>]])
    nmap("<C-l>", [[:BufferNext<CR>]])

    nmap("<M-J>", [[:BufferMovePrevious<CR>]])
    nmap("<M-L>", [[:BufferMoveNext<CR>]])
end


--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

nmap(";", ":", { silent = false, desc = "Command mode" })
nmap("s", ":HopWord<CR>", { nowait = true, desc = "EasyMotion - Jump to word" })
imap("jk", "<ESC>", "Exit insert mode")
nmap("M-s", ":w<CR>", "Save current buffer")

cmap("<M-BS>", "<C-w>", "Delete preceeding word")
imap("<M-BS>", "<C-w>", "Delete preceeding word")

cmap("<M-J>", "<S-Left>", "Move back one word")
cmap("<M-L>", "<S-Right>", "Move back one word")

nmap("Y", "y$", "Yank to end of line")
vmap("Y", "ygv", "Yank without exiting visual mode")
nmap("<leader>y", "m'0v$<left>y`'", "Yank line, excluding newline character")

nmap("<leader>ot", ":terminal<CR>i", "Open terminal")

nmap("x", [["_x]], "Delete character without overwriting clipboard")
nmap("X", [["_dd]], "Delete line without overwriting clipboard")
nmap("<leader>d", [["_d]], "Delete without overwriting clipboard")

nmap("<M-I>", "m1kJ`1", "Append to line above")
nmap("<M-K>", "m1J`1", "Append to line below")

nmap("I", "v:move '<-2<CR>", "Move line up")
nmap("K", "v:move '>+1<CR>", "Move line down")
vmap("I", ":move '<-2<CR>gv=gv", "Move selection up")
vmap("K", ":move '>+1<CR>gv=gv", "Move selection down")

nmap("f.", "/<C-r><C-w><CR>", "Search word under cursor")
nmap("c.", "ciw", "Change word under cursor")
nmap("ca", [[:%s/<C-r><C-w>//g<Left><Left>]], "Replace all instances of word under cursor in current buffer")

nmap("<leader>p", "m'$p`'", "Paste at the end of the line")

-- Move to the end of yanked and pasted text
vmap("y", "y`]", "Yank (copy)")
vmap("p", "p`]", "Paste")
nmap("p", "p`]", "Paste")

imap("<C-v>", "<C-r>+", "Paste from system clipboard")
cmap("<C-v>", "<C-r>+", "Paste from system clipboard")

nmap("<leader>O", "m'O<ESC>`'", "Open line above without insert mode")
nmap("<leader>o", "m'o<ESC>`'", "Open line below without insert mode")

nmap("<leader>cd", ":lcd %:p:h<CR>:pwd<CR>", { desc = "Change working directory to current directory", silent = false })


--------------------------------------------------------------------------------
-- Comments
--------------------------------------------------------------------------------

-- nmap("<M-/>", [[:lua Comment.toggle.linewise()<CR><Down>]])
-- vmap("<M-/>", [[:lua Comment.locked("toggle.linewise")(vim.fn.visualmode())<CR>]])

if Comment then
    nmap("<M-/>", [[:lua Comment.toggle.linewise()<CR><Down>]])
    vmap("<M-/>", [[:lua Comment.locked("toggle.linewise")(vim.fn.visualmode())<CR>]])
elseif MiniComment then
    nmap("<M-/>", [[:lua MiniComment.toggle_lines(vim.fn.line("."), vim.fn.line("."))<CR><Down>]])
    vmap("<M-/>", [[:lua MiniComment.toggle_lines(vim.fn.line("'<"), vim.fn.line("'>"))<CR>]])
end


--------------------------------------------------------------------------------
-- Surround
--------------------------------------------------------------------------------

nmap("Sa", surround.add,     "Add surrounding pair")
nmap("Sd", surround.delete,  "Delete surrounding pair")
nmap("Sr", surround.replace, "Replace surrounding pair")
nmap("cs", surround.replace, "Replace surrounding pair")
vmap("Sa", surround.add,     "Add surrounding pair")
vmap("Sd", surround.delete,  "Delete surrounding pair")


--------------------------------------------------------------------------------
-- Toggles
--------------------------------------------------------------------------------

nmap("<leader>tc", ":ColorizerToggle<CR>", "Toggle Colorizer")
nmap("<leader>tf", "za", "Toggle fold under cursor")
nmap("<leader>tF", "zA", "Toggle all folds under cursor")
nmap("<M-e>", Snacks.picker.explorer, "Toggle file explorer")
nmap("<leader>th", ":set hlsearch!<CR>", "Toggle search highlighting")
nmap("<leader>/", ":noh<CR>", "Clear search highlighting")
nmap("<leader>tw", ":set wrap!<CR>", "Toggle word-wrapping")
nmap("<leader>tnr", ":set relativenumber!<CR>", "Toggle relative line numbers")
nmap("<leader>|", fn.toggle_color_column, "Toggle color column")
-- nmap("<leader>ti", ":IBLToggle<CR>", "Toggle indentation guidelines")
nmap("<leader>ti", Snacks.toggle.indent, "Toggle indentation guidelines")


--------------------------------------------------------------------------------
-- Command mode
--------------------------------------------------------------------------------

cmap("<C-j>", "<home>", "Move cursor to start of line")
cmap("<C-l>", "<end>", "Move cursor to end of line")
cmap("<M-I>", "<Up>", "Previous command history entry")
cmap("<M-K>", "<Down>", "Next command history entry")
cmap("<M-j>", "<Left>", "Move cursor back one character")
cmap("<M-l>", "<Right>", "Move cursor forward one character")


--------------------------------------------------------------------------------
-- Navigation
--------------------------------------------------------------------------------

map("j", "h")
map("h", "i")

nmap("q", "b")
nmap("Q", "B")

nmap("H", "^i")
vmap("H", "^i")

-- Traverse word-wrapped lines as separate lines
map("i", "gk")
map("k", "gj")
-- map("i", [[v:count == 0 ? "gk" : "k"]], { expr = true })
-- map("k", [[v:count == 0 ? "gj" : "j"]], { expr = true })

imap("<M-i>", "<Up>")
imap("<M-k>", "<Down>")
imap("<M-j>", "<Left>")
imap("<M-l>", "<Right>")

nmap("<", "<C-o>") -- Jump back
nmap(">", "<C-i>") -- Jump forward

nmap("<C-k>",  "<C-d>") -- Half-page down
vmap("<C-k>",  "<C-d>") -- Half-page down


--------------------------------------------------------------------------------
-- Multi-Cursor
--------------------------------------------------------------------------------

nmap("<C-d>", multic.matchAddCursor)
nmap("<C-u>", multic.matchSkipCursor)
nmap("<Esc>", multic.clearCursors)
nmap("<c-leftmouse>", multic.handleMouse)
nmap("<c-leftdrag>", multic.handleMouseDrag)
nmap("<c-leftrelease>", multic.handleMouseRelease)


--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------

nmap("tt", ":Trouble diagnostics toggle<CR>")
nmap("tt", ":Trouble diagnostics toggle<CR>")

nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gD", ":lua vim.lsp.buf.declaration()<CR>")
nmap("gt", ":lua vim.lsp.buf.type_definition()<CR>")
nmap("gi", ":lua vim.lsp.buf.implementation()<CR>")
nmap("gw", ":lua vim.lsp.buf.document_symbol()<CR>")
-- nmap("gw", ":lua vim.lsp.buf.workspace_symbol()<CR>")
nmap("<leader>af", ":lua vim.lsp.buf.code_action()<CR>")
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ho", ":lua vim.lsp.buf.hover()<CR>")
nmap("<leader>he", ":lua vim.lsp.buf.signature_help()<CR>")


--------------------------------------------------------------------------------
-- barbar.nvim
--------------------------------------------------------------------------------

nmap("<leader>bca", ":BufferCloseAllButCurrent<CR>")
nmap("<leader>bcr", ":BufferCloseBuffersRight<CR>")
nmap("<leader>bs",  ":BufferPick<CR>")
nmap("<leader>bp",  ":BufferPin<CR>")


--------------------------------------------------------------------------------
-- Buffers
--------------------------------------------------------------------------------

nmap("<M-w>", ":exit<CR>")
nmap("<C-w>", fn.closeBufferOrWindow, { nowait = true })

-- nmap("ZQ", ":lua fn.closeBufferOrWindow()<CR>")
-- nmap("ZZ", ":w<CR>:lua fn.closeBufferOrWindow()<CR>")

nmap("<BS>", "<C-^>", "Switch to previous buffer")
-- Create new, unsaved file at current directory
nmap("<leader>bf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]],   { silent = false })
-- Open file from current directory in vertical split
nmap("<leader>bv", [[:vsp <C-R>=expand("%:p:h") . "/" <CR>]], { silent = false })

-- nmap("<leader>bQ", [[:w <bar> %bd <bar> e#<CR>]])             -- quit all buffers but current
-- nmap("<leader>b%", ":luafile %<CR>", { silent = false })          -- source buffer
-- nmap("<leader>bn", [[:enew<CR>]], { silent = false })             -- new buffer


--------------------------------------------------------------------------------
-- Indentation
--------------------------------------------------------------------------------

--  imap("<Tab>",   "<Nop>")
--  imap("<S-Tab>", "<Nop>")

nmap("<Tab>",   ">>")  -- Indent
nmap("<S-Tab>", "<<")  -- Dedent
vmap("<Tab>",   ">gv") -- Indent without exiting visual mode
vmap("<S-Tab>", "<gv") -- Dedent without exiting visual mode

-- vmap("\x1b[105;5u", "<C-u>") -- Insert tab literal


--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------

-- nmap("<M-s>", ":vsplit<CR>:wincmd l<CR>", "Open split to the right")
nmap("<M-o>", ":vsplit<CR>:wincmd l<CR>", "Open split to the right")
nmap("<M-u>", ":split<CR>:wincmd j<CR>", "Open split above")

nmap("<S-Up>",    ":resize -10<CR>", "Decrease pane height")
nmap("<S-Down>",  ":resize +10<CR>", "Increase pane height")
nmap("<S-Left>",  ":vertical resize -10<CR>", "Decrease pane width")
nmap("<S-Right>", ":vertical resize -10<CR>", "Increase pane width")

--  nmap("<S-Up>", ":lua require'core.util'.resize(false, -2)<CR>")
--  nmap("<S-Down>", ":lua require'core.util'.resize(false, 2)<CR>")
--  nmap("<S-Left>", ":lua require'core.util'.resize(true, -2)<CR>")
--  nmap("<S-Right>", ":lua require'core.util'.resize(true, 2)<CR>")

-- nmap("<C-h>", "<C-w>h")
-- nmap("<C-j>", "<C-w>j")
-- nmap("<C-k>", "<C-w>k")
-- nmap("<C-l>", "<C-w>l")
-- nmap("<leader>wq", "<C-w>q") -- quit window
-- nmap("<leader>ws", "<C-w>s") -- split window
-- nmap("<leader>wv", "<C-w>v") -- vertical split
-- nmap("<leader>wh", "<C-w>h") -- jump to left window
-- nmap("<leader>wj", "<C-w>j") -- jump to the down window
-- nmap("<leader>wk", "<C-w>k") -- jump to the up window
-- nmap("<leader>wl", "<C-w>l") -- jump to right window
-- nmap("<leader>wm", "<C-w>|") -- max out to fullscreen
-- nmap("<leader>w=", "<C-w>=") -- equally high and width
-- nmap("<leader>wT", "<C-w>T") -- break out into a new tab
-- nmap("<leader>wr", "<C-w>x") -- replace current with next

--------------------------------------------------------------------------------
-- Quickfix list mappings
--------------------------------------------------------------------------------

-- nmap("[q", ":cprevious<CR>")
-- nmap("]q", ":cnext<CR>")
-- nmap("[Q", ":cfirst<CR>")
-- nmap("]Q", ":clast<CR>")
-- nmap("[l", ":lprevious<CR>")
-- nmap("]l", ":lnext<CR>")
-- nmap("[L", ":lfirst<CR>")
-- nmap("]L", ":llast<CR>")


--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------

map("<M-d>", ":Telescope file_browser path=%:p:h<CR>")
map("<M-F>", ":ProjectRoot<CR>:Telescope live_grep<CR>")
-- map("<M-p>", ":ProjectRoot<CR>:Telescope find_files<CR>")
-- map("<M-p>", ":ProjectRoot<CR>:lua Snacks.picker.files()<CR>", "Search files")
map("<M-p>",      Snacks.picker.files, "Search files")
map("<M-b>",      telescope.buffers, { silent = false })
map("<leader>bb", telescope.buffers, { silent = false })
map("<leader>pp", Snacks.picker.pickers, "Search pickers")
nmap("<M-O>",     telescope.lsp_document_symbols)

--  map("<M-O>", ":Telescope aerial<CR>")

-- nmap("<leader>fq", ":Telescope quickfix<CR>")
-- nmap("<leader>fR", ":Telescope registers<CR>")
-- nmap("<leader>fr", ":Telescope oldfiles<CR>")
-- nmap("<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
-- nmap("<leader>fC", ":Telescope command_history<CR>")
-- nmap("<leader>fc", ":Telescope commands<CR>")
-- nmap("<leader>fs", ":Telescope search_history<CR>")
-- nmap("<leader>fl", ":Telescope loclist<CR>")


--------------------------------------------------------------------------------
-- Git
--------------------------------------------------------------------------------

-- nmap("<leader>gl", ":Gitsigns toggle_current_line_blame<CR>") -- toggle line blame
-- nmap("<leader>gh", fn.open_current_line_commit) -- toggle line blame
nmap("<leader>gl", Snacks.picker.git_log_line, "Git log line")
nmap("<leader>gb", Snacks.git.blame_line, "Git blame line")
nmap("<leader>gd", ":DiffviewOpen<CR>")                       -- show diff
nmap("<leader>gr", ":Gitsigns refresh<CR>")

-- nmap("<leader>gB", ":Telescope git_branches<CR>")   -- git branches
-- nmap("<leader>gf", ":Telescope git_files<CR>")      -- git files
-- nmap("<leader>gc", ":Telescope git_commits<CR>")    -- git commits

-- nmap("<leader>gp", ":Gitsigns preview_hunk<CR>")    -- preview hunk
-- nmap("<leader>gr", ":Gitsigns reset_hunk<CR>")      -- reset hunk
-- nmap("<leader>gR", ":Gitsigns reset_buffer<CR>")    -- reset buffer
-- nmap("<leader>gu", ":Gitsigns undo_stage_hunk<CR>") -- undo last stage hunk
-- nmap("<leader>gs", ":Gitsigns stage_hunk<CR>")      -- git stage hunk
-- nmap("<leader>gS", ":Gitsigns stage_buffer<CR>")    -- git stage buffer
-- nmap("<leader>g[", ":Gitsigns prev_hunk<CR>")       -- previous hunk
-- nmap("<leader>g]", ":Gitsigns next_hunk<CR>")       -- next hunk


--------------------------------------------------------------------------------
-- Session
--------------------------------------------------------------------------------

nmap("<leader>sm",  starter.open, "Open start menu")
nmap("<leader>sl", sessions.select, "Load session")
nmap("<leader>ss", function() sessions.write(vim.fn.input("Session name: ")) end, "Save session")
nmap("<leader>sd", function() sessions.delete(vim.fn.input("Session name: ")) end, "Delete session")


--------------------------------------------------------------------------------
-- help
--------------------------------------------------------------------------------

-- nmap("<leader>hh",  ":Telescope help_tags<CR>")
-- nmap("<leader>hm",  ":Telescope man_pages<CR>")
-- nmap("<leader>ht",  ":Telescope colorscheme<CR>")
-- nmap("<leader>ho",  ":Telescope vim_options<CR>")
