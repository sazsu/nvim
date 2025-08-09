return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        ignore = { '*' },
        typeCheckingMode = 'off',
      },
    }
  },
  root_markers = {
    'pyproject.toml',
    'uv.lock',
  },
}
