return { -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {

    -- Bootstrap
    'rambhosale/cmp-bootstrap.nvim',

    -- Snippets
    'saadparwaiz1/cmp_luasnip',

    -- Zsh
    'tamago324/cmp-zsh',

    -- SQL
    'ray-x/cmp-sql',

    -- Dotenv
    'SergioRibera/cmp-dotenv',

    -- Buffer / Vim-builtin functionality
    'hrsh7th/cmp-omni',
    'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-cmdline',
    'uga-rosa/cmp-dictionary',

    -- LSP
    'onsails/lspkind-nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'luckasRanarison/tailwind-tools.nvim',

    -- Filesystem paths
    'hrsh7th/cmp-path',

    -- Fuzzy finding
    -- {
    --   'tzachar/cmp-fuzzy-buffer',
    --   dependencies = {
    --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    --     'tzachar/fuzzy.nvim',
    --   },
    -- },
    -- {
    --   'tzachar/cmp-fuzzy-path',
    --   dependencies = {
    --     { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    --     'tzachar/fuzzy.nvim',
    --   },
    -- },
    -- 'lukas-reineke/cmp-rg',

    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
    },
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Scroll the documentation window [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<c-y>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        --['<CR>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        -- LSP
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },

        -- Snippets
        { name = 'luasnip' },

        -- Buffer / Vim-builtin functionality
        { name = 'buffer' },
        {
          name = 'dictionary',
          keyword_length = 2,
        },

        -- Omni (fallback for omnifunc)
        {
          name = 'omni',
          option = {
            disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' },
          },
        },

        -- Filesystem paths
        { name = 'path' },

        -- Fuzzy finding
        { name = 'fuzzy_buffer' },
      },

      -- Enable cmp-bootstrap for Twig files
      cmp.setup.filetype('twig', {
        sources = cmp.config.sources {
          { name = 'cmp_bootstrap' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
      }),
    }
  end,
  opts = function()
    return {
      -- ...
      formatting = {
        format = require('lspkind').cmp_format {
          before = require('tailwind-tools.cmp').lspkind_format,
        },
      },
    }
  end,
}
