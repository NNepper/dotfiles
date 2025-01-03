{ config, pkgs, ... }: {
  programs = {
    git = import ./git.nix;
    zsh = import ./zsh.nix { inherit config pkgs; };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    ssh = import ./ssh.nix;
    gpg = import ./gpg.nix;
    alacritty = import ./alacritty.nix { inherit pkgs; };
  };
}

