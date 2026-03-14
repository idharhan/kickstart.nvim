-- UI improvements for messages, cmdline, and popupmenu
return {
  'folke/noice.nvim',
  lazy = false,
  opts = {
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
}

