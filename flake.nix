{
  description = "lol";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system} = {
        blog = pkgs.stdenv.mkDerivation {
          name = "blog";
          version = "0.1.0";
          buildInputs = with pkgs; [ hugo ];
          src = self;

          buildPhase = ''
            cd blog
            hugo --minify
          '';

          installPhase = ''
            cp -r public $out
          '';
        };
      };
    };
}
