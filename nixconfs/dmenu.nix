with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenv.mkDerivation rec {
  name = "ava-dmenu-5.0";
  src = fetchzip {
    url = "https://github.com/alexvanaxe/ava_dmenu/archive/master.zip";
    sha256 = "sha256-eXmOmXigs8ICjJfWxu+TxDvkYzyFX24VmHOXL5HtV1U=";
  };

  buildInputs = [ xorg.libX11 xorg.libXinerama zlib xorg.libXft ];

  postPatch = ''
    sed -ri -e 's!\<(dmenu|dmenu_path|stest)\>!'"$out/bin"'/&!g' dmenu_run
    sed -ri -e 's!\<stest\>!'"$out/bin"'/&!g' dmenu_path
  '';

  preConfigure = ''
    sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk
  '';

  makeFlags = [ "CC:=$(CC)" ];

  meta = with lib; {
    description = "A generic, highly customizable, and efficient menu for the X Window System";
    homepage = "https://tools.suckless.org/dmenu";
    license = licenses.mit;
    maintainers = with maintainers; [ pSub globin ];
    platforms = platforms.all;
  };
}
