{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];

    extraConfig = ''
      # set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on
      set -g @catppuccin_flavour 'mocha'
    '';
  };

}
