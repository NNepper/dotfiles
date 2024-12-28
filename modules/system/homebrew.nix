{...}: {
  homebrew = {
    enable = true;
    casks = [
      "firefox"
      "cursor"
      "displaylink"
      "spotify"
      "tailscale" # Tailscale Mesh VPN 
      "windows-app" # Microsoft Remote Desktop
      "aldente" # Battery management
      "docker" # Docker Desktop
      "font-fira-code-nerd-font" # Needed for alacritty
      "anaconda"
    ];
    brews = [
      "ffmpeg"
    ];
    
    onActivation.cleanup = "zap"; # Remove non declared casks
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
} 
