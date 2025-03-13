-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rc',
  callback = function()
    local docs = {
      setVersion = 'Defines version variable and alternatives',
      setEnv = 'Sets environment variable',
      setGrid = 'Defines grid membership',
      -- Add more as needed
    }

    vim.keymap.set('n', '<Leader>K', function()
      local word = vim.fn.expand '<cword>'
      if docs[word] then
        vim.api.nvim_echo({ { docs[word], 'Normal' } }, false, {})
      end
    end, { buffer = true })
  end,
})
