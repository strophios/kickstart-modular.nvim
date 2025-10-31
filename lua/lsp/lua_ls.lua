-- I'm letting lazydev.nvim handle the task of configuring lua_ls for working on my Neovim config and am thus using a very basic
-- default configuration here. However, there is a more complex one recommended in the nvim-lspconfig docs for the case that
-- you're primarily using lua for Neovim, so that might be worth trying out at some point or if lazydev doesn't seem to be getting
-- me what I want.
--
-- Links:
--  - https://github.com/folke/lazydev.nvim
--  - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      diagnostics = {
        disable = {
          'trailing-space',
          -- "missing-fields"
        },
      },
      -- telemetry = {
      --   enable = false,
      -- }
    },
  },
}
