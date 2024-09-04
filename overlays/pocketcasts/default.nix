{ ... }:

final: prev: {
  t0psh31f = (prev.t0psh31f or { }) // {
    pocketcasts = prev.makeDesktopItem {
      name = "Pocketcasts";
      desktopName = "Pocketcasts";
      genericName = "It’s smart listening, made simple.";
      exec = ''
        ${final.firefox-beta}/bin/firefox "https://play.pocketcasts.com/podcasts?t0psh31f.app=true"'';
      icon = ./icon.svg;
      type = "Application";
      categories = [ "Network" "Feed" "AudioVideo" "Audio" "Player" ];
      terminal = false;
    };
  };
}
