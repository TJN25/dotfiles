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

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'rc',
--   callback = function()
--     local docs = {
--       setVersion = 'Defines version variable and alternatives',
--       setEnv = 'Sets environment variable',
--       setGrid = 'Defines grid membership',
--       -- Add more as needed
--     }
--
--     vim.keymap.set('n', '<Leader>K', function()
--       local word = vim.fn.expand '<cword>'
--       if docs[word] then
--         vim.api.nvim_echo({ { docs[word], 'Normal' } }, false, {})
--       end
--     end, { buffer = true })
--   end,
-- })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.rc' },
  callback = function()
    vim.bo.filetype = 'rc'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rc',
  callback = function()
    local docs = {
      setVersion = 'Defines version variable and alternatives',
      setEnv = 'Sets environment variable',
      setGrid = 'Defines grid membership',
      addEnv = 'Adds to a defined environment variable (Args: var, value)',
      setEnv = 'Defines environment variable (Args: var, value)',
      unsetEnv = 'Removes environment variable (Arg: var)',
      setName = "Defines appname when can't be determined programmatically (Arg: name)",
      customVersion = 'Like setVersion but with custom naming (Args: var, value)',
      setAlias = 'Creates env var or script matching alias (Args: name, value)',
      unsetAlias = 'Clears alias (Arg: name)',
      osGt = 'Conditional for OS > version (Arg: version)',
      osLt = 'Conditional for OS < version (Arg: version)',
      osEq = 'Conditional for OS = version (Arg: version)',
      fileTest = 'Conditional file check (Args: test, path)',
      if64bit = 'Conditional check for 64-bit architecture',
      ifnot64bit = 'Conditional check for not 64-bit',
      ifarm64 = 'Conditional check for arm64',
      ifnotarm64 = 'Conditional check for not arm64',
      ifVersion = 'Conditional check for specific version (Arg: version)',
      ifSet = 'Conditional check if variable is set (Arg: var)',
      ifUnset = 'Conditional check if variable is not set (Arg: var)',
      elseIf = 'Else if condition',
      elseTest = 'Else condition',
      endTest = 'Ends any test conditional',
      runIt = 'Runs an executable for diagnostics (Arg: command)',
      comment = 'Prints comment in generated files (Arg: text)',
      echoOut = 'Prints message to stdout (Arg: text)',
      echoErr = 'Prints message to stderr (Arg: text)',
      fileRead = 'Sources a file (Args: sh_file, csh_file)',
      addSub = 'Extends installation to use subdirectory (Arg: subdir)',
      versionRC = 'Supports version-specific Environment Definition File',
      setDep = 'Defines version dependencies (Args: app@ver, dep@ver)',
      testSane = 'Automated testing tool for sanity tests',
      testDev = 'Automated testing for curation (Arg: test)',
      runDeploy = 'Runs tool during deployment (Arg: command)',

      -- Variables
      verdir = 'Path to version directory: /programs/[arch]/app/version',
      appdir = 'Path to application directory: /programs/[arch]/app',
      appvar = 'Environment variable for application: ${APP[_M|_X]}',
      appver = 'Version variable: APP{_M|_X]',
      appname = 'Name of the application',
      rcfile = 'Capsules only',
      APP_DEP_SET = 'Dependencies (capsules only)',
      __SBCAP = 'Appname of capsule',
      SB_PATH = 'Path variable',
      PATHS_FIRST = 'Priority paths',
      SBCAP_PATH = 'Capsule path (capsules only)',
      SBCAP_METRICS = 'Metrics setting (capsules only)',

      -- Common Environment Variables
      PATH = 'Executable search path',
      PYTHONPATH = 'Python module search path',
      LD_LIBRARY_PATH = 'Shared library search path',
      LIBRARY_PATH = 'Static library search path',
      MANPATH = 'Man page search path',
      INCLUDE = 'C header file search path',
      CPATH = 'C/C++ header file search path',
      PKG_CONFIG_PATH = 'Package configuration file search path',
      PERL5LIB = 'Perl module search path',
      CLASSPATH = 'Java class search path',
      DYLD_LIBRARY_PATH = 'macOS dynamic library search path',
      PYTHONHOME = 'Python installation directory',
      JAVA_HOME = 'Java installation directory',
      CUDA_HOME = 'CUDA installation directory',
      CUDA_PATH = 'CUDA installation directory',
    }

    vim.keymap.set('n', '<Leader>K', function()
      local word = vim.fn.expand '<cword>'
      if docs[word] then
        -- Create popup
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, { docs[word] })

        -- Show popup below cursor
        local opts = {
          relative = 'cursor',
          row = 1,
          col = 0,
          width = #docs[word] + 2,
          height = 1,
          style = 'minimal',
          border = 'rounded',
        }

        local win = vim.api.nvim_open_win(buf, false, opts)

        -- Auto-close popup
        vim.defer_fn(function()
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
          end
        end, 3000) -- Close after 3 seconds
      end
    end, { buffer = true })
  end,
})
