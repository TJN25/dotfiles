-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- Undotree visualizes the undo history and makes it easy to browse and switch between different undo branches.
-- https://github.com/mbbill/undotree

return {
  'mbbill/undotree',
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Open [U]ndotree' }),
}
