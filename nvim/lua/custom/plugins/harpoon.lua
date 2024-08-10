return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[Add] to harpoon' })
    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open [h]arpoon' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Switch to the [1]th harpoon file' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Switch to the [2]th harpoon file' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Switch to the [3]th harpoon file' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Switch to the [4]th harpoon file' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = 'Switch to [H]arpoon [P]revious file' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = 'Switch to [H]arpoon [N]ext file' })

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hs', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
