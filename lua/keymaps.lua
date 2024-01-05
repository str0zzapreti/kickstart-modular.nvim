-- [[ Basic Keymaps ]]

-- Keymaps for better experience
-- Unbinds default spacebar function (highlighting the current word) so it can be used
-- as the leader key instead. Also unbinds the arrow keys in normal mode to encourage
-- use of vim motions, rebinds backspace to delete the character under the cursor and
-- enter to add a new line and enter insert mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Up>', '<Nop>', { silent = true, desc = 'Learn vim motions today!' })
vim.keymap.set('n', '<Down>', '<Nop>', { silent = true, desc = 'Learn vim motions today!' })
vim.keymap.set('n', '<Left>', '0', { silent = true, desc = 'Learn vim motions today!' })
vim.keymap.set('n', '<Right>', '$', { silent = true, desc = 'Learn vim motions today!' })
vim.keymap.set('n', '<BS>', 'i<BS>', { silent = true })
vim.keymap.set('n', '<Enter>', 'n', { silent = true })
vim.keymap.set('n', 'ZZ', '<Nop>', { silent = true, desc = 'Just use :x instead' })
vim.keymap.set('n', 'r', '<C-r>', { silent = true })

-- Keymaps for dealing with word wrap
-- Specifically, maps k and j to gj and gk respectively when a line wraps. By default
-- k and j would skip over any wrapped text since it's still technically the same 'line'
-- while gk and gj navigate to the next visual line.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Interface Keymaps
vim.keymap.set('n', '<leader>fe', vim.cmd.Ex, {desc = '[F]ile [E]xplorer'})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
