local builtin = require('telescope.builtin')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git" }
    }
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
