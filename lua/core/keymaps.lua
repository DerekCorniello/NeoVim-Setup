vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

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


-- remaps space to leader
vim.g.mapleader = " "

-- opens viewer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- packer sync
vim.keymap.set("n", "<leader>res", vim.cmd.PackerSync)

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
        vim.cmd.Git({'push'})
    end, opts)
vim.keymap.set("n", "<leader>gP", function()
        vim.cmd.Git({'pull'})
    end, opts)
vim.keymap.set("n", "<leader>gac", function()
        vim.cmd.Git({'add -A'})
        vim.cmd.Git({'commit'})
    end, opts)
vim.keymap.set("n", "<leader>gc", function()
        vim.cmd.Git({'commit'})
    end, opts)
