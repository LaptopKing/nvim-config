return {
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm ci && npm run build',
    config = true,
    opts = {
      on_save_enabled = true, -- If `true`, automatically enables on save sorting.
      on_save_pattern = { '*.html', '*.jsx', '*.tsx', '*.hbs', '*.blade.php', '*.heex', '*.astro', '*.vue' }, -- The file patterns to watch and sort.
      node_path = 'node',
      trim_spaces = true, -- If `true`, trim any extra spaces after sorting.
    },
  },
}
