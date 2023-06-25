with import <nixpkgs> {};
let
  pythonEnv = python3.withPackages (ps: [
	 ps.pygobject3 ps.pydbus ps.click ps.i3ipc 
  ]);
in mkShell {
  packages = [
    pythonEnv
  ];
}
