return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- if you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- e.g. "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "bufreadpre path/to/my-vault/**.md",
  --   "bufnewfile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- required.
    'nvim-lua/plenary.nvim',
    -- see below for full list of optional dependencies 👇
  },
  -- opts = {
  --
  --   -- see below for full list of options 👇
  -- },
  config = function()
    require('obsidian').setup {
      disable_frontmatter = true,
      workspaces = {
        {
          name = 'main',
          path = '/users/nicth99p/documents/notes',
        },
      },
      ui = {
        -- use markdown.nvim instead for these
        checkboxes = {},
        bullets = {},
        external_link_icon = {},
      },
    }
  end,
}
