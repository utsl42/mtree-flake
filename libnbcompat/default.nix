{ lib, stdenv, fetchFromGitHub, pkgs }:

stdenv.mkDerivation rec {
  pname = "libnbcompat";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "archiecobbs";
    repo = "libnbcompat";
    rev = "${version}";
    sha256 = "sha256-DyBLEp5dNYSQgTzdQkGfLdCtX618EbnVy5FmL75BMdU=";
  };

  nativeBuildInputs = with pkgs; [ autoreconfHook pkg-config];
  buildInputs = [ ];
  outputs = [ "out" "dev" ];

  meta = with lib; {
    description = "libnbcompat is a portable NetBSD-compatibility library";
    homepage = "https://github.com/archiecobbs/libnbcompat";
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
