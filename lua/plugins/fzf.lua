return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require 'fzf-lua'

    -- Search operation on files keymaps
    vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = 'Fzf Buffers' })
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Fzf Files' })
    vim.keymap.set('n', '<leader>fg', fzf.live_grep_native, { desc = 'Fzf Grep' })
    vim.keymap.set('n', '<leader>fo', fzf.oldfiles, { desc = 'Fzf Old files' })
    vim.keymap.set('n', '<leader>fz', fzf.blines, { desc = 'Fzf Search in Current Buffer' })
    vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = 'Fzf Resume Prev. Operation' })

    -- Fzf help keymaps
    vim.keymap.set('n', '<leader>fs', fzf.builtin, { desc = 'Fzf Builtin' })
    vim.keymap.set('n', '<leader>fk', fzf.keymaps, { desc = 'Fzf Keymaps' })

    -- Fzf Treesitter
    vim.keymap.set('n', '<leader>ft', fzf.treesitter, { desc = 'Fzf Treesitter' })

    -- Fzf Lsp
    vim.keymap.set('n', '<leader>fq', fzf.quickfix, { desc = 'Fzf Quickfix' })
    vim.keymap.set('n', '<leader>fw', fzf.diagnostics_workspace, { desc = 'Fzf Workspace Lsp Diagnostics' })
    vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = 'Fzf Document Lsp Diagnostics' })
  end,
}
