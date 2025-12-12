vim.api.nvim_create_user_command(
  'ToggleInlayHints', function()
    local ih_is_enabled = vim.lsp.inlay_hint.is_enabled
    vim.lsp.inlay_hint.enable(not ih_is_enabled())
    print(
      'Inlay hints ' .. (ih_is_enabled() and 'disabled' or 'enabled')
    )
  end, {}
)
