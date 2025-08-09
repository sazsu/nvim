return {
  'rustaceanvim',
  lazy = false,
  after = function(_)
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ['rust-analyzer'] = {
            procMacro = { enable = true },
            cargo = { allFeatures = true },
            completion = {
              enable = true,
              autoimport = { enable = true },
            },
          },
        },
      }
    }
  end
}
