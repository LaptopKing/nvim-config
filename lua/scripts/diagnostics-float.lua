local group = vim.api.nvim_create_augroup('OoO', {})

local function au(typ, pattern, cmdOrFn)
  if type(cmdOrFn) == 'function' then
    vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
  else
    vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
  end
end

au({ 'CursorHold', 'InsertLeave' }, nil, function()
  local opts = {
    focusable = false,
    scope = 'cursor',
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
  }
  vim.diagnostic.open_float(nil, opts)
end)

au('InsertEnter', nil, function()
  vim.diagnostic.enable(false)
end)

au('InsertLeave', nil, function()
  vim.diagnostic.enable(true)
end)
