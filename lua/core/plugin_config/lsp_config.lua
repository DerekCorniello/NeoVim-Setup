require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "pylsp", "gopls", "tsserver", "denols", "jsonls" }
})
local completion_callback = require('cmp_nvim_lsp').on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require 'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    on_attach = completion_callback,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
require('lspconfig').pylsp.setup {
    capabilities = capabilities,
    on_attach = completion_callback
}

local util = require "lspconfig/util"

require('lspconfig').gopls.setup {
    capabilities = capabilities,
    on_attach = completion_callback,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern { "go.work", "go.mod", ".git" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            }
        }
    }
}

require('lspconfig').tsserver.setup{
    capabilities = capabilities,
    on_attach = completion_callback,
}
require('lspconfig').denols.setup{
    capabilities = capabilities,
    on_attach = completion_callback,
}
require('lspconfig').jsonls.setup{
    capabilities = capabilities,
    on_attach = completion_callback,
}
