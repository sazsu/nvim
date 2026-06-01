return {
  cmd = { 'clangd' },
  filetypes = { 'cpp' },
  init_options = {
    fallbackFlags = { '-std=c++20' },
  },
  on_attach = function(_, bufnr)
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
  end
}
