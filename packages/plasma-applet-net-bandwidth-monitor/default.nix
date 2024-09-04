{ libsForQt5, lib, fetchFromGitHub, extra-cmake-modules, cmake }:

libsForQt5.mkDerivation rec {
  name = "plasma-applet-net-bandwidth-monitor";

  src = fetchFromGitHub {
    owner = "LeeVD";
    repo = name;
    rev = "6f86fa64aec1030f579c3602902b9bf5b83a922e";
    sha256 = "sha256-CrKqbHHCJgLXWmUsvY74QPN4Op6hobOCamh5P3YSQgU=";
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

  meta = with lib; {
    description = "A beautiful control centre widget for KDE Plasma directly inspired by the MacOS control centre.";
    homepage = "https://github.com/Prayag2/kde_controlcentre";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
