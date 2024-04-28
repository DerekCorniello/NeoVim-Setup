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
    ensure_installed = { "lua_ls", "rust_analyzer", "pylsp" }
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
