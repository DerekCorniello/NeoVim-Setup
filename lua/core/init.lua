local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
    severity_sort = true,
    float = {
        source = "always",
    },
    virtual_text = {
        prefix = '●',
    },
})

local plugins =
{
    "navarasu/onedark.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "nvim-treesitter/nvim-treesitter",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "mfussenegger/nvim-dap",
    "windwp/nvim-ts-autotag",
    "ray-x/web-tools.nvim",
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { 'kevinhwang91/promise-async' }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', "meuter/lualine-so-fancy.nvim" }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}
require("lazy").setup(plugins)
