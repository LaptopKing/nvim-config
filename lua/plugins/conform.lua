return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    ignore_errors = false,
    notify_on_error = true,
    notify_no_formatters = true,
    log_level = vim.log.levels.DEBUG,

    format_on_save = function(bufnr)
      local disable_filetypes = {}
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,

    formatters = {
      shfmt = {
        append_args = { '-i', '4' },
      },
    },

    formatters_by_ft = {
      -- Lua
      lua = { 'stylua' },

      -- JS/TS World
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      vue = { lsp_format = 'fallback' },

      -- PHP/Laravel
      php = { 'php_cs_fixer', 'phpcbf', stop_after_first = true },
      blade = { 'blade-formatter' },

      -- SH World
      -- bash = { 'shfmt' },
      sh = { 'shfmt' },
      -- zsh = { 'beautysh },

      ['_'] = { 'trim_whitespace' },
    },
  },
}
