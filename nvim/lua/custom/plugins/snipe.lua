return {
  "leath-dub/snipe.nvim",
  config = function()
    local snipe = require("snipe")
    snipe.setup()
    vim.keymap.set("n", "<leader>nn", snipe.create_buffer_menu_toggler(), { desc = 'Ope[n] S[n]ipe' })
  end
}
