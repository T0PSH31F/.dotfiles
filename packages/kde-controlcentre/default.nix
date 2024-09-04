{ libsForQt5, lib, fetchFromGitHub, extra-cmake-modules, cmake }:

libsForQt5.mkDerivation rec {
  name = "kde-controlcentre";

  src = fetchFromGitHub {
    owner = "Prayag2";
    repo = "kde_controlcentre";
    rev = "cbf5ea1aa7238f950a5e213caafcdf9cc64c720e";
    sha256 = "sha256-3go8Blnm6F5CN2KuxkPupHdquqWtBVp09XYTfcopk3k=";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
  ];

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
    description = "A beautiful control centre widget for KDE Plasma directly inspired by the MacOS control centre.";
    homepage = "https://github.com/Prayag2/kde_controlcentre";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
