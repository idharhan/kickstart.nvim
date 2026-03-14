-- Excalidraw integration
return {
  'marcocofano/excalidraw.nvim',
  opts = {
    storage_dir = '~/.excalidraw',
    templates_dir = '~/.excalidraw/templates',
    open_on_create = true,
    relative_path = true,
    picker = {
      link_scene_mapping = '<C-l>',
    },
  },
}

