{ lib, stdenvNoCC }:

stdenvNoCC.mkDerivation {
  name = "kde-warm-eyes";
  src = ./WarmEyes.colors;

  dontUnpack = true;
  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/color-schemes
    cp -r $src $out/share/color-schemes/WarmEyes.colors

    runHook postInstall
  '';

  meta = with lib; {
    description = "A light and warm color scheme for Plasma.";
    homepage = "https://store.kde.org/p/2067943";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
