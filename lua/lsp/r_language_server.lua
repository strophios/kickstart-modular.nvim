return {
  cmd = { 'R', '--no-echo', '-e', 'languageserver::run()' },
  filetypes = { 'r' },
  root_dir = function(bufnr, on_dir) -- Not totally sure what this does, but it's in the nvim-lspconfig config, so...
    on_dir(vim.fs.root(bufnr, '.git') or vim.uv.os_homedir())
  end,
}
