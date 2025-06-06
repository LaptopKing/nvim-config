return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    ignore_errors = false,
    notify_on_error = false,
    notify_no_formatters = true,
    log_level = vim.log.levels.WARN,

    format_on_save = function(bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename:match '%.min%..+' then
        return
      end
      return { timeout_ms = 3000, lsp_fallback = true }
    end,

    formatters = {
      shfmt = {
        append_args = { '-i', '4' },
      },
      djlint = {
        append_args = {
          -- '--format-css',
          -- '--format-js',
          '--close-void-tags',
          '--format-attribute-template-tags',
        },
      },
    },

    formatters_by_ft = {
      -- Lua
      lua = { 'stylua' },

      -- JS/TS/HTML World
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      vue = { lsp_format = true },

      -- Config file World
      yaml = { 'prettierd', 'prettier', stop_after_first = true },

      -- PHP/Laravel
      php = { 'php_cs_fixer', 'phpcbf', stop_after_first = true },
      blade = { 'blade-formatter' },
      twig = { 'djlint', 'twig-cs-fixer' },

      -- SH World
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      -- zsh = { 'beautysh' }, -- Doesn't work for some reason

      ['_'] = { 'trim_whitespace' },
    },
  },
}
