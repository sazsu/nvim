local colorscheme = nixCats('colorscheme')
vim.cmd.colorscheme(colorscheme)

require('lze').load {
  { import = 'conf.plugins.lsp' },
  { import = 'conf.plugins.telescope' },
  { import = 'conf.plugins.luasnip' },
  { import = 'conf.plugins.blink' },
  { import = 'conf.plugins.yazi' },
  { import = 'conf.plugins.mini' },
  { import = 'conf.plugins.treesitter' },
  { import = 'conf.plugins.rustaceanvim' },
  { import = 'conf.plugins.lualine' },
  { import = 'conf.plugins.gitsigns' },
  { import = 'conf.plugins.typst-preview' },
  { import = 'conf.plugins.indent-blankline' },
  { import = 'conf.plugins.wakatime' },
}
require('conf.plugins.lsp')
