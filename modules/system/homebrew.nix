{...}: {
  homebrew = {
    enable = true;
    casks = [
      "firefox"
      "cursor"
      "duckduckgo"
      "displaylink"
      "spotify"
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
