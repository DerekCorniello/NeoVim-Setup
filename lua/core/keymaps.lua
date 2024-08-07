vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("USERPROFILE") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- remaps space to leader
vim.g.mapleader = " "

-- opens viewer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moves selected text with tabbing
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- joins next line keeping cursor at one point
vim.keymap.set("n", "J", "mzJ`z")

-- keeps cursor in middle of screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- deletes highlighted word to void register and preserves register
vim.keymap.set("x", "<leader>d", [["_dP]])

-- yanks to system register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("v", "<C-c>", [["+y]])
vim.keymap.set("n", "<leader>yy", [["+Y]])

-- paste from system register
vim.keymap.set({ "n", "v" }, "<C-v>", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>p<leader>", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

-- format whole package
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick-fix nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replaces word that you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- git keybinds
vim.keymap.set("n", "<leader>G", vim.cmd.Git);
vim.keymap.set("n", "<leader>gp", function()
    vim.cmd.Git({ 'push' })
end)
vim.keymap.set("n", "<leader>gP", function()
    vim.cmd.Git({ 'pull' })
end)
vim.keymap.set("n", "<leader>gac", function()
    vim.cmd.Git({ 'add -A' })
    vim.cmd.Git({ 'commit' })
end)
vim.keymap.set("n", "<leader>gc", function()
    vim.cmd.Git({ 'commit' })
end)
vim.keymap.set("n", "<leader>gs", function()
    vim.cmd.Git({ 'status' })
end)

-- maps for go json tag
vim.keymap.set("n", "<leader>goj", function()
    vim.cmd("GoTagAdd json <CR>")
end)

vim.keymap.set('n', '<leader><tab>', '<c-w>p')
vim.keymap.set('t', '<leader><tab>', '<c-\\><c-n><c-w>w')

-- Move across tabs
vim.keymap.set('n', '<leader><tab>h', '<c-w>h')
vim.keymap.set('n', '<leader><tab>j', '<c-w>j')
vim.keymap.set('n', '<leader><tab>k', '<c-w>k')
vim.keymap.set('n', '<leader><tab>l', '<c-w>l')

-- go to def or dec, and open in side pane.
vim.keymap.set("n", "gD", ":sp | :resize 12 | lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", ":sp | :resize 12 | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- search for word under cursor.
function FindOccurence()
    -- Get the word under the cursor
    local word = vim.fn.expand('<cword>')
    -- Open a new pane
    vim.cmd('sp')
    vim.cmd('wincmd w')
    vim.cmd('resize 12')
    -- Send the search command to the new pane
    vim.cmd('/' .. word)
end

-- Create a keybinding to trigger the function
vim.api.nvim_set_keymap('n', 'go', ':lua FindOccurence()<CR> | n', { noremap = true, silent = true })

vim.keymap.set({"n", "v"}, "<leader>ew", ':lua vim.diagnostic.open_float()<CR>')
