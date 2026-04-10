return {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'flake.lock' },
  settings = {
    nixd = {
      nixpkgs = 'import <nixpkgs> {}',
      formatting = {
        command = { 'alejandra', },
      },
      options = {
        darwin = {
          expr = '(builtins.getFlake (toString ./.).darwinConfigurations.zephyr.options)',
        },
        home_manager = {
          expr = '(builtins.getFlake (toString ./.).homeConfigurations."em@zephyr".options)',
        },
      },
    },
  },
}
