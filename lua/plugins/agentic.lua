return {
    "carlos-algms/agentic.nvim",

    event = "VeryLazy",

    opts = {
        -- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp"
        provider = "gemini-acp", -- setting the name here is all you need to get started
        debug = true,
        opts = {
            diff_preview = {
                enabled = true,
                layout = "inline", -- "split" or "inline"
                center_on_navigate_hunks = true,
            },
            -- acp_providers = {
            --     ["gemini-acp"] = {
            --         default_mode = "plan", -- start sessions in plan mode
            --     },
            -- },
            -- Keybindings for ALL buffers in the widget (chat, prompt, code, files)
            keymaps = {
                widget = {
                    close = "q", -- String for a single keybinding
                    change_mode = {
                        {
                            "<S-Tab>",
                            mode = { "i", "n", "v" }, -- Specify modes for this keybinding
                        },
                    },
                },
            },
        },
    },

    -- these are just suggested keymaps; customize as desired
    keys = {
        {
            "<C-a>t",
            function()
                require("agentic").toggle()
            end,
            mode = { "n", "v", "i" },
            desc = "Toggle Agentic Chat",
        },
        {
            "<C-a>f",
            function()
                require("agentic").add_selection_or_file_to_context()
            end,
            mode = { "n", "v" },
            desc = "Add file or selection to Agentic to Context",
        },
        {
            "<C-a>s",
            function()
                require("agentic").new_session()
            end,
            mode = { "n", "v", "i" },
            desc = "New Agentic Session",
        },
        {
            "<C-a>r", -- ai Restore
            function()
                require("agentic").restore_session()
            end,
            desc = "Agentic Restore session",
            silent = true,
            mode = { "n", "v", "i" },
        },
    },
}
