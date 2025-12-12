return {
  cmd = { 'jinja-lsp' },
  filetypes = { 'jinja', 'htmldjango', 'html.jinja' },
  settings = {
    templates = { './templates' },
    backend = { './src' },
  },
}
