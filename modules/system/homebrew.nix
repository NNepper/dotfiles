{...}: {
  homebrew = {
    enable = true;
    casks = [
      "aldente" # Battery management
      "anaconda"
      "chromium"
      "cursor"
      "displaylink"
      "docker" # Docker Desktop
      "font-fira-code-nerd-font" # Needed for alacritty
      "spotify"
      "tailscale" # Tailscale Mesh VPN
      "windows-app" # Microsoft Remote Desktop
    ];
    brews = [
      "ffmpeg"
      "redpanda-data/tap/redpanda" # Redpanda Kafka RPK
    ];
    
    onActivation.cleanup = "zap"; # Remove non declared casks
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
} 
