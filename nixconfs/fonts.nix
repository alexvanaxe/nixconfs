with import <nixpkgs> {}; # bring all of Nixpkgs into scope

stdenvNoCC.mkDerivation rec {
  pname = "ava-fonts";
  version = "1.000";

  src = fetchzip {
    url = "https://github.com/alexvanaxe/fonts/archive/master.zip";
    hash = "sha256-qmWdFMs9b2mYmUuGpi20o+rObComo7qCVRwjrMObvQA=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/wmfontsttf
    install -Dm644 *.otf -t $out/share/fonts/wmfontsotf

    runHook postInstall
  '';

  meta = with lib; {
    description = "A typeface designed for source code";
    longDescription = ''
      Hack is hand groomed and optically balanced to be a workhorse face for
      code. It has deep roots in the libre, open source typeface community and
      expands upon the contributions of the Bitstream Vera & DejaVu projects.
      The face has been re-designed with a larger glyph set, modifications of
      the original glyph shapes, and meticulous attention to metrics.
    '';
    homepage = "https://sourcefoundry.org/hack/";

    /*
      "The font binaries are released under a license that permits unlimited
      print, desktop, and web use for commercial and non-commercial
      applications. It may be embedded and distributed in documents and
      applications. The source is released in the widely supported UFO format
      and may be modified to derive new typeface branches. The full text of
      the license is available in LICENSE.md" (From the GitHub page)
    */
    license = licenses.free;
    maintainers = with maintainers; [ alexvanaxe ];
    platforms = platforms.all;
  };
}
