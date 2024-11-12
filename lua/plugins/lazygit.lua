-- LazyGit
return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    -- { '<leader>gg', ':!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- lazygit <CR><CR>', desc = 'LazyGit' },
    {
      '<leader>gg',
      ':!tmux popup -d ' .. vim.fn.getcwd() .. ' -xC -yC -w' .. math.floor(vim.api.nvim_win_get_width(0) * 0.95) .. ' -h' .. math.floor(
        vim.api.nvim_win_get_height(0) * 0.95
      ) .. ' -E lazygit<CR><CR>',
      desc = 'LazyGit',
    },
  },
}
