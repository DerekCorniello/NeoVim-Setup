require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "eslint", "rust_analyzer" }
})

require 'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
require'lspconfig'.eslint.setup{}
require'lspconfig'.rust_analyzer.setup{}
