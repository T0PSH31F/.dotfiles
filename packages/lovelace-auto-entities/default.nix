{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "lovelace-auto-entities";
  version = "1.13.0";

  src = fetchFromGitHub {
    owner = "thomasloven";
    repo = "lovelace-auto-entities";
    rev = "refs/tags/v${version}";
    hash = "sha256-ls8Jqt5SdiY5ROhtaSS4ZvoY+nHv6UB1RYApOJzC1VQ=";
  };

  dontBuild = true;

  installPhase = ''

    mkdir $out
    cp -v auto-entities.js $out/

  '';

  passthru.entrypoint = "auto-entities.js";

  meta = with lib; {
    description = "🔹Automatically populate the entities-list of lovelace cards";
    homepage = "https://github.com/thomasloven/lovelace-auto-entities";
    license = licenses.mit;
  };
}
