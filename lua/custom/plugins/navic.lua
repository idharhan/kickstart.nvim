-- Code context breadcrumbs
return {
  'SmiteshP/nvim-navic',
  event = 'VeryLazy',
  opts = {
    separator = ' ',
    highlight = true,
    lazy_update_context = true,
    lsp = {
      auto_attach = true,
      preference = { 'gopls' },
    },
  },
}

