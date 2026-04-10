return {
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        lazy = true,
        cmd = "ConformInfo",
        opts = function(_, opts)
            opts.ignore_errors = false
            opts.notify_on_error = false
            opts.notify_no_formatters = true
            opts.log_level = vim.log.levels.WARN

            opts.formatters = {
                shfmt = {
                    append_args = { "-i", "4" },
                },
                djlint = {
                    append_args = {
                        -- '--format-css',
                        -- '--format-js',
                        "--close-void-tags",
                        "--format-attribute-template-tags",
                    },
                },
            }

            opts.formatters_by_ft = {
                -- Lua
                lua = { "stylua" },

                -- Python
                python = { "autopep8" },

                -- JS/TS/HTML World
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                scss = { "prettierd", "prettier", stop_after_first = true },
                markdown = { "prettierd", "prettier", stop_after_first = true },
                vue = { "prettierd", "prettier", stop_after_first = true },

                -- Config file World
                yaml = { "prettierd", "prettier", stop_after_first = true },

                -- PHP/Laravel
                php = { "php_cs_fixer", "phpcbf", stop_after_first = true },
                blade = { "blade-formatter" },
                twig = { "djlint", "twig-cs-fixer" },

                -- SH World
                bash = { "shfmt" },
                sh = { "shfmt" },
                -- zsh = { 'beautysh' }, -- Doesn't work for some reason

                ["_"] = { "trim_whitespace" },
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping["<C-y>"] = cmp.mapping.confirm({ select = true })
            opts.mapping["<CR>"] = cmp.mapping.abort()
        end,
    },
}