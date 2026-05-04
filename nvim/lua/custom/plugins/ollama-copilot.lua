return {
  'Jacob411/Ollama-Copilot',
  enabled = false,
  opts = {
    model_name = 'gemma4:e2b',
    ollama_url = 'http://localhost:11434',
    stream_suggestion = false,
    python_command = '/usr/bin/python3',
    filetypes = { 'go', 'lua', 'python', 'sh', 'bash', 'markdown' },

    ollama_model_opts = {
      num_predict = 40,
      temperature = 0.1,
    },
  },
}
