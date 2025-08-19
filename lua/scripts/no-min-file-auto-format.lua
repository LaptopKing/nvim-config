vim.api.nvim_create_autocmd('BufReadPre', {
  pattern = '*.min.*',
  callback = function()
    vim.b.autoformat = false -- If your formatter respects this variable
  end,
})
