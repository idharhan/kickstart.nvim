-- Git diff viewer
return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<Leader>gd', '<cmd>DiffviewFileHistory --base=LOCAL %<CR>', desc = 'Diff File' },
    { '<Leader>gv', '<cmd>DiffviewOpen<CR>', desc = 'Diff View' },
  },
  opts = function()
    local actions = require 'diffview.actions'
    vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
      group = vim.api.nvim_create_augroup('rafi_diffview', {}),
      pattern = 'diffview:///panels/*',
      callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.winhighlight = 'CursorLine:WildMenu'
      end,
    })

    vim.opt.fillchars:append { diff = '╱' }
    vim.api.nvim_set_hl(0, 'CustomDiffChangeOld', { bg = '#25171C' })
    vim.api.nvim_set_hl(0, 'CustomDiffChangeNew', { bg = '#12261E' })

    return {
      hooks = {
        diff_buf_win_enter = function(bufnr, winid, ctx)
          if ctx.layout_name:match '^diff2' then
            if ctx.symbol == 'a' then
              vim.opt_local.winhl = table.concat({
                'DiffText:DiffviewDiffDelete',
                'DiffAdd:DiffviewDiffAddAsDelete',
                'DiffDelete:DiffviewDiffDelete',
                'DiffChange:CustomDiffChangeOld',
              }, ',')
            elseif ctx.symbol == 'b' then
              vim.opt_local.winhl = table.concat({
                'DiffDelete:DiffviewDiffDelete',
                'DiffChange:CustomDiffChangeNew',
              }, ',')
            end
          end
        end,
      },
      enhanced_diff_hl = false,
      default_args = {
        DiffviewOpen = { '--imply-local' },
      },
      file_panel = {
        win_config = {
          width = 40,
        },
      },
      keymaps = {
        view = {
          { 'n', 'q', actions.close },
          { 'n', '<Tab>', actions.select_next_entry },
          { 'n', '<S-Tab>', actions.select_prev_entry },
          { 'n', '<LocalLeader>e', actions.toggle_files },
        },
        file_panel = {
          { 'n', 'q', actions.close },
          { 'n', 'h', actions.prev_entry },
          { 'n', 'o', actions.focus_entry },
          { 'n', 'gf', actions.goto_file },
          { 'n', 'sg', actions.goto_file_split },
          { 'n', 'st', actions.goto_file_tab },
          { 'n', '<C-r>', actions.refresh_files },
          { 'n', '<LocalLeader>e', actions.toggle_files },
        },
        file_history_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<CR>' },
          { 'n', 'o', actions.focus_entry },
          { 'n', 'O', actions.open_in_diffview },
        },
      },
    }
  end,
}

