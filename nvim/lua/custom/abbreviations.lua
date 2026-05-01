vim.keymap.set('i', '!ge', 'if err != nil {<CR>    // handle error<CR><CR>}', {
  noremap = true,
})
vim.keymap.set('i', '!mc', '- [ ] ', { noremap = true })
