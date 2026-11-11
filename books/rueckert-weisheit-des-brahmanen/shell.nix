{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [pkgs.saxon-he];
}
