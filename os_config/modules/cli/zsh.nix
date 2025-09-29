{
  lib,
  pkgs,
  system,
  inputs,
  userName,
  ...
}: {
  home-manager.users.${userName} = {
    imports = [
      inputs.agenix.homeManagerModules.default
    ];
    age.identityPaths = ["/home/${userName}/.ssh/id_rsa"];
    # age.secrets.mach12pass.file = ../secrets/mach12pass.age;
    home = {
      stateVersion = "25.05";
      packages = with pkgs; [
        inputs.nixvim-config.packages.${system}.default
        starship
        ripgrep
        git
        lazygit
      ];
    };
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        shellAliases = {
          grep = "rg";
          vi = "nvim";
        };
        oh-my-zsh = {
          enable = true;
          plugins = ["git" "dirhistory" "history"];
        };
        # TODO: poetry config virtualenvs.in-project true
        # When md and <S-j> get error in decorator provider
        autocd = true;
        initContent = lib.mkMerge [
          # bash
          ''
            dir_paths=("$HOME/clones" "$HOME/projects")
            file_paths=()
            projects=("https://github.com/Mach1212/MachInfra.git")
            for item in $dir_paths[@]; do
                if [ ! -f $item ]; then
                    echo "Dir $item does not exist, creating directories..."
                    mkdir -p $item
                fi
            done
            for item in $file_paths[@]; do
                if [ ! -f $item ]; then
                  echo "File $item does not exist, creating directories and file..."
                  mkdir -p $(dirname $item) && touch $item
                fi
            done
            for item in $projects[@]; do
                if [ ! -f $item ]; then
                  echo "Git project $item doesn't exist. Cloning..."
                  $(cd $HOME/projects && git clone $item)
                fi
            done
          ''
          (lib.mkOrder
            1500
            # bash
            ''
              eval "$(starship init zsh)"
            '')
        ];
      };
    };
  };
}
