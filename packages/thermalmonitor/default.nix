{ libsForQt5, lib, fetchFromGitHub }:

libsForQt5.mkDerivation rec {
  name = "thermalmonitor";

  src = fetchFromGitHub {
    owner = "olib14";
    repo = "thermalmonitor";
    rev = "v0.1.3";
    sha256 = "sha256-Gp2PWn8arDblIrgZYuBf08GJ29Nwg4cY33xoJXdD/t8=";
  };

  buildInputs = with libsForQt5; [
    kcoreaddons
    kdeclarative
    kdecoration
    plasma-framework
  ];

  dontBuild = true;

  # 1. --global still installs to $HOME/.local/share so we use --packageroot
  # 2. plasmapkg2 doesn't copy metadata.desktop into place, so we do that manually
  installPhase = ''
    runHook preInstall

    plasmapkg2 --type plasmoid --install ${src}/package --packageroot $out/share/plasma/plasmoids

    runHook postInstall
  '';

  meta = with lib; {
    description = "A KDE Plasmoid for displaying system temperatures.";
    homepage = "https://invent.kde.org/olib/thermalmonitor";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
