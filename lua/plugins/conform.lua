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
    notify_on_error = false,
    ignore_errors = false,
    lang_to_ft = {
      bash = 'sh',
    },
    lang_to_ext = {
      bash = 'sh',
      c_sharp = 'cs',
      elixir = 'exs',
      javascript = 'js',
      julia = 'jl',
      latex = 'tex',
      markdown = 'md',
      python = 'py',
      ruby = 'rb',
      rust = 'rs',
      teal = 'tl',
      typescript = 'ts',
    },
    format_on_save = function(bufnr)
      local disable_filetypes = {}
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      jsx = { 'prettierd', 'prettier', stop_after_first = true },
      tsx = { 'prettierd', 'prettier', stop_after_first = true },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      vue = { lsp_format = 'fallback' },
      php = { 'php_cs_fixer', 'phpcbf', stop_after_first = true },
      bash = { 'beautysh' },
      zsh = { 'beautysh' },
    },

    ft_parsers = {
      javascript = 'babel',
      javascriptreact = 'babel',
      typescript = 'typescript',
      typescriptreact = 'typescript',
      vue = 'vue',
      css = 'css',
      scss = 'scss',
      less = 'less',
      html = 'html',
      json = 'json',
      jsonc = 'json',
      yaml = 'yaml',
      markdown = 'markdown',
      ['markdown.mdx'] = 'mdx',
      graphql = 'graphql',
      handlebars = 'glimmer',
    },
  },
}
