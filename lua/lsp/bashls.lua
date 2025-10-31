return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }, -- add .zsh? .slurm?
  root_markers = { '.git' },
  settings = {
    bashIde = {
      globPattern = '*@(.sh|.inc|.bash|.command)',
    },
  },
}
