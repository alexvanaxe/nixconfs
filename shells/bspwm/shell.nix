with import <nixpkgs> {overlays = [ (import ./mpv_ov.nix) ];};

let
  pythonEnv = python3.withPackages (ps: [
	 ps.pygobject3 ps.pydbus ps.click ps.i3ipc 
  ]);
in mkShell {
  packages = [
    pythonEnv

    # Desktops apps
    bspwm
    sxhkd
    dunst
    polybar
    nitrogen
    # media
    yt-dlp
    sxiv
    imagemagick
    picom
    playerctl
    mpv

    # utilities
    gnome.pomodoro
    tmux
    fzf
    zsh
    eww
    xclip
    # programming
    neovim
    wezterm

    qutebrowser
    fd
    (import ./dmenu.nix)
  ];
}
