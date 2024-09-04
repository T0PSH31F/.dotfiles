{ libsForQt5, lib, fetchFromGitHub }:

libsForQt5.mkDerivation rec {
  name = "kde-minimalistclock";

  src = fetchFromGitHub {
    owner = "Prayag2";
    repo = "kde_minimalistclock";
    rev = "9b0d8bbd2ae2380f69339edd6fc2beec957bd5f8";
    sha256 = "sha256-rnO9Pf7J8eESeN/DDpfCElUIfPVYzD1BHV3sXfj+o0M=";
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
    description = "A minimalist looking clock for KDE!";
    homepage = "https://github.com/Prayag2/kde_minimalistclock";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
