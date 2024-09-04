{ pkgs }:

let
  img = ../wallpapers/wallpapers/pixel-art/pa-space-01.jpg;
in
pkgs.stdenv.mkDerivation rec {
  name = "abstractdark-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "3ximus";
    repo = name;
    rev = "e817d4b27981080cd3b398fe928619ffa16c52e7";
    sha256 = "sha256-XmhTVs/1Hzrs+FBRbFEOSIFOrRp0VTPwIJmSa2EgIeo=";
  };
  installPhase = ''
    mkdir -p $out/share/sddm/themes/abstractdark-sddm-theme
    cp -R ./* $out/share/sddm/themes/abstractdark-sddm-theme
    cp ${img} $out/share/sddm/themes/abstractdark-sddm-theme/background.png
  '';
}
