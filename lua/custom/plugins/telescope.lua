-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        prompt_prefix = '   ',
        selection_caret = ' ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'telescope live grep' })
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'telescope find buffers' })
    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'telescope find files' })
    vim.keymap.set('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'telescope find all files' })
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'telescope help page' })
    vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
    vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'telescope find oldfiles' })
    vim.keymap.set('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
    vim.keymap.set('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
    vim.keymap.set('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })
    vim.keymap.set('n', '<leader>pt', '<cmd>Telescope terms<CR>', { desc = 'telescope pick hidden term' })

    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

