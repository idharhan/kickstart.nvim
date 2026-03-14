-- Kanagawa colorscheme
return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'kanagawa'
  end,
  opts = {
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    terminalColors = true,
    colors = {
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    theme = 'wave',
    background = {
      dark = 'wave',
      light = 'lotus',
    },
  },
  config = function(_, opts)
    require('kanagawa').setup(opts)
    vim.cmd.colorscheme 'kanagawa'
  end,
}

