with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation rec {
  name = "my-dmenu-5.0";
  src = fetchurl {
    url = "https://github.com/alexvanaxe/ava_dmenu/archive/master.zip";
    sha256 = "";
  };
}
