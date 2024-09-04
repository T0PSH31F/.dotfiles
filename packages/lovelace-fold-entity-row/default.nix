{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "lovelace-fold-entity-row";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "thomasloven";
    repo = "lovelace-fold-entity-row";
    rev = "refs/tags/${version}";
    hash = "sha256-7hUkIq4Js8ingtWuQwcBNyNNxg7dFLerGY/bbguP/do=";
  };

  dontBuild = true;

  installPhase = ''

    mkdir $out
    cp -v fold-entity-row.js $out/

  '';

  passthru.entrypoint = "fold-entity-row.js";

  meta = with lib; {
    description = "🔹 A foldable row for entities card, containing other rows";
    homepage = "https://github.com/thomasloven/lovelace-fold-entity-row";
    license = licenses.mit;
  };
}
