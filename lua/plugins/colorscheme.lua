-- Colorscheme Configuration
return {
  -- List of colorscheme plugins, change the command in `config` as needed.

  -- 'folke/tokyonight.nvim',
  -- 'andersevenrud/nordic.nvim',
  -- 'Mofiqul/dracula.nvim',
  -- 'ellisonleao/gruvbox.nvim',
  -- 'rebelot/kanagawa.nvim',
  -- 'sainnhe/gruvbox-material',
  'olimorris/onedarkpro.nvim',

  -- Ensures the colorscheme loads before all other start plugins.
  priority = 1000,

  config = function()
    -- Load the selected colorscheme.
    vim.cmd.colorscheme 'onedark_vivid'

    -- Configure highlights; example for disabling italics on comments.
    vim.cmd.hi 'Comment gui=none'

    -- Optional message to confirm the colorscheme loaded successfully.
    print 'Colorscheme loaded successfully!'
  end,
}
