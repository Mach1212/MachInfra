{
  lib,
  pkgs,
  system,
  inputs,
  uid,
  extraGroups,
  ...
}: let
  userName = "mach12";
in {
  users.users.${userName} = {
    inherit uid extraGroups;
    isNormalUser = true;
    description = "Maciej Pruchnik";
    hashedPassword = "$6$ZtQ9AV7qlyLB7IV5$/ZBW5blW7ndJsqycYY2NcVjHLbmXpJsmdTFLQHKRvQHsB9/6W02U0k0/6baVjNOn4QcOUrQwMRgWzFfnggDbr/"; # mkpasswd -m sha-512 myPassword
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpAKr38MocXOkLtWT//RV+WgbIif9azFZIq17+ppl+tpyyXAk+hAJrsHvYT1yMRoXsuxeJUBAv2v66ajxtHQ5YRk6fTg/r1CB1sa0RoKP1e2xZLbdicHKeBnVH6GX+VPVrXkw1wMKsrc0/28yH3LC69m7ImdkDaBMO50LX1ctODOFwD765MUcsbOtVK7EDGr0BUc+Ck7qhozeBMtS2A55u8M4hSUG0My92iRtB4czlKKYPR56tzXxaE7tR9C12Y6Uq8Ok1D5bOAZeL9wIRoVeaLr290upO5clHyCaUkMIFrshkwUQR0E4iV0nACvrzj9Hzm/4sWlpsQkTI5lUcCKMj ssh-key-2023-11-18"];
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
  };

  home-manager.users.${userName} = {
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
          (lib.mkOrder 1
            # bash
            ''
              local dir_paths=("$HOME/clones" "$HOME/projects")
              local file_paths=()
              local projects=("https://github.com/Mach1212/MachInfra.git")
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
              cd "$HOME/projects"
              for item in $projects[@]; do
                  if [ ! -f $item ]; then
                    echo "Git project $item doesn't exist. Cloning..."
                    git clone $item
                  fi
              done
              cd -
            '')
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
