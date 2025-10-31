-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim', -- Not sure whether we actually need this anymore.
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- NOTE: The following line is now commented as blink.cmp extends capabilites by default from its internal code:
      -- https://github.com/Saghen/blink.cmp/blob/102db2f5996a46818661845cf283484870b60450/plugin/blink-cmp.lua
      -- It has been left here as a comment for educational purposes (as the predecessor completion plugin required this explicit step):
      --
      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      -- local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- NOTE: LSP configuration now happens elsewhere, we just use mason to ensure certain LSPs (and other tools) are installed.
      --
      -- Ensure the following servers and tools are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = {
        'ruff',
        'ty',
        'marksman',
        'r_language_server',
        'bashls',
        'clangd',
        'lua_ls',
      }
      -- Other potential LSPs and tools we may wish to install:
      -- bqls = {}, -- BigQuery SQL
      -- cmake = {}, -- cmake
      -- contextive = {}, -- "Contextive allows you to define terms in a central file and provides auto-completion suggestions and hover panels for these terms wherever they're used".
      -- copilot = {}, -- for GitHub copilot integration
      -- html = {},
      -- jinja_lsp = {}, -- for Jinja SQL templating (I think)
      -- -- maybe want a LaTex LSP?
      -- markdown_oxide = {}, -- "Editor Agnostic PKM: you bring the text editor and we bring the PKM. Inspired by and compatible with Obsidian."
      -- nushell = {}, -- In case I decide to start using nushell
      -- postgres_lsp = {}, -- "A collection of language tools and a Language Server Protocol (LSP) implementation for Postgres, focusing on developer experience and reliable SQL tooling".
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      --
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
