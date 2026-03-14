-- Open files in GitHub
return {
  'almo7aya/openingh.nvim',
  cmd = {
    'OpenInGHRepo',
    'OpenInGHFile',
    'OpenInGHFileLines',
  },
  keys = {
    { '<leader>gr', '<cmd>:OpenInGHRepo<cr>', desc = 'Open in GitHub' },
    { '<leader>gf', '<cmd>:OpenInGHFile<cr>', desc = 'Open File in GitHub' },
    { '<leader>gl', '<cmd>:OpenInGHFileLines<cr>', desc = 'Open File Lines in GitHub' },
  },
}

