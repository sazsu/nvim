return {
  'nvim-treesitter',
  event = 'DeferredUIEnter',
  load = function(name)
    vim.cmd.packadd(name)
    vim.cmd.packadd('nvim-treesitter-textobjects')
  end,
  after = function(plugin)
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
        disable = { 'htmldjango', 'html', 'jinja', 'jinja_inline', },
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>n',
          node_incremental = '<leader>n',
          node_decremental = '<bs>',
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>va'] = '@parameter.inner',
            ['<leader>ta'] = '@function.outer',
          },
          swap_previous = {
            ['<leader>av'] = '@parameter.inner',
            ['<leader>at'] = '@function.outer',
          },
        },
      },
    }
  end,
}
