return {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'flake.lock' },
  settings = {
    nixd = {
      nixpkgs = {
        expr = '(builtins.getFlake "/Users/em/dotfiles").inputs.nixpkgs',
      },
      formatting = {
        command = { 'nix', 'fmt' },
      },
      options = {
        darwin = {
          expr = '(builtins.getFlake "/Users/em/dotfiles").darwinConfigurations.zephyr.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/Users/em/dotfiles").homeConfigurations."em@zephyr".options)',
        },
      },
    },
  },
}
