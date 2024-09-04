{ channels, ... }:

_final: prev:

let extensions = channels.nixpkgs-master.gnomeExtensions;
in
{
  gnomeExtensions = prev.gnomeExtensions // {
    inherit (extensions) audio-output-switcher;
  };
}
