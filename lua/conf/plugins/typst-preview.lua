return {
  'typst-preview.nvim',
  ft = { 'typst' },
  after = function (_)
    require('typst-preview').setup({
      invert_colors = 'auto',
    })
  end,
}
