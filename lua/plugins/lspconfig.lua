return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        opts.diagnostics = {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
        }

        opts.folds = {
            enabled = false,
        }
    end,
}
