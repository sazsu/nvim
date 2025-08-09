return {
  'telescope.nvim',
  keys = {
    { "<leader>ff", function() return require('telescope.builtin').find_files() end, mode = {'n'} },
    { "<leader>fg", function() return require('telescope.builtin').live_grep() end, mode = {'n'} },
    { "<leader>fh", function() return require('telescope.builtin').help_tags() end, mode = {'n'} },
    { "<leader>fp", function() return require('telescope.builtin').buffers() end, mode = {'n'} },
    { "<leader>fb", function() return require('telescope.builtin').colorscheme() end, mode = {'n'} },
  },
  after = function(_)
    local actions = require('telescope.actions')

    require('telescope').setup {
      defaults = {
        -- vimgrep_arguments = {
        --   "rg",
        --   "--follow",
        --   "--hidden",
        --   "--with-filename",
        --   "--line-number",
        --   "--smart-case",
        --
        --   "--glob=!**/.git/*",
        --   "--glob=!**/build/*",
        --   "--glob=!**/dist/*",
        -- },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
          },
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
        find_files = {
          find_command = {
            "rg",
            "--follow",
            "--hidden",
            "--files",
            "--glob=!**/.git/*"
          },
        },
      },
    }
  end,
}
