{
  description = "nvim config using nixCats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    nixpkgs,
    nixCats,
    neovim-nightly-overlay,
    ...
  } @ inputs: let
    inherit (nixCats) utils;
    luaPath = ./.;
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
    dependencyOverlays = [
      (utils.standardPluginOverlay inputs)
    ];
    extra_pkg_config = {};

    categoryDefinitions = {
      pkgs,
      ...
    } @ packageDef: {
      lspsAndRuntimeDeps = {
        lsps = with pkgs; {
          python = [
            ruff
            ty
            basedpyright
          ];
          lua = [
            lua-language-server
          ];
          typst = [
            tinymist
          ];
          rust = [
            rust-analyzer
          ];
          cpp = [
            clang-tools
          ];
          nix = [
            nixd
            nil
          ];
        };
        formatters = with pkgs; {
          typst = [
            typstyle
          ];
        };
      };

      startupPlugins = {
        base = with pkgs.vimPlugins; [
          lze
        ];
        general = with pkgs.vimPlugins; {
          themes = [
            catppuccin-nvim
            bamboo-nvim
            kanagawa-nvim
            gruvbox-nvim
          ];
        };
      };

      optionalPlugins = {
        navigation = with pkgs.vimPlugins; {
          telescope = [
            telescope-nvim
            plenary-nvim
          ];
          yazi = [
            yazi-nvim
          ];
        };
        general = with pkgs.vimPlugins; {
          treesitter = [
            nvim-treesitter.withAllGrammars
            nvim-treesitter-textobjects
          ];
          completion = {
            blink = [
              blink-cmp
            ];
          };
          snippets = {
            luasnip = pkgs.vimPlugins.luasnip;
          };
        };
        statusline = with pkgs.vimPlugins; {
          lualine = lualine-nvim;
        };
        mini = with pkgs.vimPlugins; [
          mini-splitjoin
          mini-pairs
        ];
        tools = with pkgs.vimPlugins; {
          rust = [
            rustaceanvim
          ];
          typst = [
            typst-preview-nvim
          ];
          git = [
            gitsigns-nvim
          ];
        };
        misc = with pkgs.vimPlugins; [
          indent-blankline-nvim
          vim-wakatime
        ];
      };
      # shared libraries to be added to LD_LIBRARY_PATH
      # variable available to nvim runtime
      environmentVariables = {
      };
    };

    packageDefinitions = {
      nvim = {
        pkgs,
        ...
      }: {
        settings = {
          suffix-path = true;
          suffix-LD = true;
          wrapRc = false;
          neovim-unwrapped = neovim-nightly-overlay.packages.${pkgs.system}.default;
        };
        categories = {
          lsps = true;
          formatters = true;
          base = true;
          general = true;
          navigation = true;
          completion = true;
          statusline = true;
          mini = true;
          tools = true;
          misc = true;
          colorscheme = "catppuccin";
        };
      };
    };
    # In this section, the main thing you will need to do is change the default package name
    # to the name of the packageDefinitions entry you wish to use as the default.
    defaultPackageName = "nvim";
  in
    # see :help nixCats.flake.outputs.exports
    forEachSystem (system: let
      nixCatsBuilder =
        utils.baseBuilder luaPath {
          inherit nixpkgs system dependencyOverlays extra_pkg_config;
        }
        categoryDefinitions
        packageDefinitions;
      defaultPackage = nixCatsBuilder defaultPackageName;
      # this is just for using utils such as pkgs.mkShell
      # The one used to build neovim is resolved inside the builder
      # and is passed to our categoryDefinitions and packageDefinitions
      pkgs = import nixpkgs {inherit system;};
    in {
      # these outputs will be wrapped with ${system} by utils.eachSystem

      # this will make a package out of each of the packageDefinitions defined above
      # and set the default package to the one passed in here.
      packages = utils.mkAllWithDefault defaultPackage;

    })
    // (let
      # we also export a nixos module to allow reconfiguration from configuration.nix
      nixosModule = utils.mkNixosModules {
        moduleNamespace = [defaultPackageName];
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      # and the same for home manager
      homeModule = utils.mkHomeModules {
        moduleNamespace = [defaultPackageName];
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
    in {
      # these outputs will be NOT wrapped with ${system}

      # this will make an overlay out of each of the packageDefinitions defined above
      # and set the default overlay to the one named here.
      overlays =
        utils.makeOverlays luaPath {
          inherit nixpkgs dependencyOverlays extra_pkg_config;
        }
        categoryDefinitions
        packageDefinitions
        defaultPackageName;

      nixosModules.default = nixosModule;
      homeModules.default = homeModule;

      inherit utils nixosModule homeModule;
      inherit (utils) templates;
    });
}
