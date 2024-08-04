return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui'
  },
  config = function()
    require("dap-python").setup("/Users/nicth99p/micromamba/envs/chess/bin/python")
    -- require("core.utils").load_mappings("dap_python")
  end
}
