return {
  {
    'mini.pairs',
    event = 'InsertEnter',
    after = function (_)
      require('mini.pairs').setup {
        mappings = {
          ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%w\\][^%w\\]' },
          ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^%w\\][^%w\\]' },
          ['`'] = { action = 'closeopen', pair = "``", neigh_pattern = '[^%w\\][^%w\\]' },
          ['('] = { action = 'open', pair = '()', neigh_pattern = '.[^%w\\]' },
          ['['] = { action = 'open', pair = '[]', neigh_pattern = '.[^%w\\]' },
          ['{'] = { action = 'open', pair = '{}', neigh_pattern = '.[^%w\\]' },
        },
      }
    end
  },
  {
    'mini.splitjoin',
    event = 'CursorMoved',
    after = function (_)
      require('mini.splitjoin').setup {
        mappings = {
          toggle = '<leader>s',
        },
      }
    end
  }
}
