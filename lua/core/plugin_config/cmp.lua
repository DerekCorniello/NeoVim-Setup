local cmp = require("cmp")
require("cmp_nvim_lsp")

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-A-n>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'nvim_lsp', max_item_count = 8 },                -- from language server
        { name = 'nvim_lsp_signature_help', max_item_count = 4 }, -- display function signatures with current parameter emphasized
        { name = 'buffer', max_item_count = 2 },                  -- source current buffer
        { name = 'vsnip', max_item_count = 1 },                   -- nvim-cmp source for vim-vsnip
        { name = 'luasnip', max_item_count = 1}
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
        },
    },
})
