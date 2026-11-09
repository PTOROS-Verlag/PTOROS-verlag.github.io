{
  description = "TEI edition of Stefan George, Gesamt-Ausgabe der Werke (Bd. 1–9)";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    devShells = builtins.mapAttrs (system: pkgs: {
      default = pkgs.mkShell {
        packages = [
          (pkgs.python3.withPackages (p: [ p.lxml p.pillow ]))
          pkgs.tesseract
          pkgs.jing
          pkgs.poppler-utils
          pkgs.curl
        ];
      };
    }) inputs.nixpkgs.legacyPackages;
  };
}
