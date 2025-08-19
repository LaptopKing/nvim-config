local uv = vim.loop

-- tmux plugin
vim.env.TMUX_PLUGIN_MANAGER_PATH = '/home/strider/.config/tmux/plugins'
vim.api.nvim_create_autocmd({ 'VimEnter', 'VimLeave' }, {
  callback = function()
    if vim.env.TMUX_PLUGIN_MANAGER_PATH then
      uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
    end
  end,
})
