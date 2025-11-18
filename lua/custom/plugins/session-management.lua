return {
  'Shatur/neovim-session-manager',
  dependencies = 'nvim-lua/plenary.nvim',
  cmd = 'SessionManager',
  keys = {
    {
      '<leader>wS',
      '<cmd>SessionManager save_current_session<cr>',
      desc = '[W]orkspace: [S]ave current session (and modified buffers)',
    },
    {
      '<leader>ws',
      '<cmd>SessionManager! save_current_session<cr>',
      desc = '[W]orkspace: [s]ave current session (not modified buffers)',
    },
    {
      '<leader>wL',
      '<cmd>SessionManager load_session<cr>',
      desc = '[W]orkspace: [L]oad session (save modified buffers)',
    },
    {
      '<leader>wl',
      '<cmd>SessionManager! load_session<cr>',
      desc = "[W]orkspace: [l]oad session (don't save modified buffers)",
    },
  },
  config = true,
}
