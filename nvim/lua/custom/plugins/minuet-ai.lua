return {
  'milanglacier/minuet-ai.nvim',
  enabled = false,
  event = 'VeryLazy',
  config = function()
    require('minuet').setup {
      provider = 'openai_fim_compatible',
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:3b',
          optional = {
            max_tokens = 64,
            temperature = 0.0,
            top_p = 0.9,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { 'lua', 'go', 'python', 'sh', 'bash', 'markdown' },
        keymap = {
          accept = '<A-:>',
          accept_line = '<A-;>',
          accept_n_lines = '<A-z>',
          prev = '<A-[>',
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
    }
  end,
}
