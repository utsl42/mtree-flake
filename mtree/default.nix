{ lib, stdenv, pkgs, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "mtree";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "jashank";
    repo = "mtree-portable";
    rev = "fea79f387c592cede1217b8d019549d8d6b42235";
    sha256 = "sha256-VBm5oDquYvR2TeOlSRAzOGSQ3L8K3Ci8aZxJ8sg1PEU=";
  };

  nativeBuildInputs = with pkgs; [ autoreconfHook pkg-config];
  buildInputs = with pkgs; [ libnbcompat libmd ];

  meta = with lib; {
    description = "mtree: a utility for mapping and checking directory hierarchies";
    homepage = "https://github.com/jashank/mtree-portable";
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
