-- Statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      { theme = 'seoul256' },
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
        {
          'navic',
        },
      },
    },
  },
}

