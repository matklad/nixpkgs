{ stdenv, fetchurl, doxygen, qt5 }:

stdenv.mkDerivation rec {
  name = "signon-${version}";
  version = "8.57";
  src = fetchurl {
    url = "https://gitlab.com/accounts-sso/signond/repository/archive.tar.gz?ref=${version}";
    sha256 = "1vqkxhmdjk3217k38l2s3wld8x7f4jrbbh6xbr036cn1r23ncni5";
  };

  buildInputs = [ qt5.base ];
  nativeBuildInputs = [ doxygen ];

  configurePhase = ''
    qmake PREFIX=$out LIBDIR=$out/lib CMAKE_CONFIG_PATH=$out/lib/cmake/SignOnQt5
  '';

}
