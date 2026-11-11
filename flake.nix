{
  description = "PTOROS Verlag: website and books";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    # editions: fixed releases rather than channels, so `nix flake update` cannot move them
    nixpkgs-25-05.url = "https://releases.nixos.org/nixos/25.05/nixos-25.05.813814.ac62194c3917/nixexprs.tar.xz";
    nixpkgs-26-05.url = "https://releases.nixos.org/nixos/26.05/nixos-26.05.13936.ac588ef1c914/nixexprs.tar.xz";
  };

  outputs =
    inputs:
    let
      # typst and font versions decide line and page breaks, so a reprint must build with the
      # nixpkgs the book was printed with. unlisted books use the current one.
      printedWith = {
        bruno-frank-koptisch-muss-sein = inputs.nixpkgs-25-05;
        daphnis-kai-chloe = inputs.nixpkgs-25-05;
        gastmahl-der-schatten = inputs.nixpkgs-25-05;
        rueckert-weisheit-des-brahmanen = inputs.nixpkgs-25-05;
        seneca-epistulae = inputs.nixpkgs-26-05;
      };

      books = builtins.attrNames (
        inputs.nixpkgs.lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./books)
      );

      pkgsFor = system: name: (printedWith.${name} or inputs.nixpkgs).legacyPackages.${system};

      toolchain =
        pkgs:
        let
          # one file per face: with ttf/otf or static/variable duplicates, typst's pick depends on
          # directory order. these are the files the printed books embed.
          fonts = pkgs.runCommand "book-fonts" { } ''
            mkdir $out
            plex=$(find ${pkgs.ibm-plex} -name 'IBMPlexMono-*.ttf')
            # ibm-plex 1.1.0 ships otf only
            [ -n "$plex" ] || plex=$(find ${pkgs.ibm-plex} -name 'IBMPlexMono-*.otf')
            for f in \
              $(find ${pkgs.alegreya-sans} ${pkgs.eb-garamond} -name '*.ttf') \
              $(find ${pkgs.junicode} -name 'Junicode-*.ttf') \
              $plex
            do
              ln -s $f $out/
            done
          '';
        in
        {
          packages = [
            (pkgs.typst.withPackages (p: [
              p.hydra_0_5_1
              p.hydra_0_6_0
            ]))
            (pkgs.texliveBasic.withPackages (p: [
              p.bookcover
              p.fgruler
              p.fontspec
              p.latexmk
              p.pgf
              p.xcolor
              p.xetex
              p.xkeyval
            ]))
            pkgs.python3
            pkgs.saxon-he
            pkgs.gnumake
          ];
          # only these fonts, so a build never depends on what the host has installed
          env = {
            FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = [ fonts ]; };
            TYPST_FONT_PATHS = fonts;
            TYPST_IGNORE_SYSTEM_FONTS = "true";
          };
        };

      book =
        pkgs: name:
        let
          t = toolchain pkgs;
        in
        pkgs.stdenvNoCC.mkDerivation (
          {
            inherit name;
            # the frontmatter and cover read the kartei and shared templates
            src = inputs.nixpkgs.lib.fileset.toSource {
              root = ./.;
              fileset = inputs.nixpkgs.lib.fileset.unions [
                ./books.toml
                ./shared
                ./books/${name}
              ];
            };
            nativeBuildInputs = t.packages;
            buildPhase = ''
              runHook preBuild
              export HOME=$TMPDIR
              cd books/${name}
              make all 2>&1 | tee build.log
              # typst substitutes a missing font with a warning only
              if grep 'unknown font family' build.log; then exit 1; fi
              runHook postBuild
            '';
            installPhase = ''
              runHook preInstall
              mkdir -p $out
              cp *.pdf $out/
              runHook postInstall
            '';
          }
          // t.env
        );

      # covers are cropped from the books' cover.pdf
      website =
        pkgs: books:
        pkgs.stdenvNoCC.mkDerivation {
          name = "website";
          src = inputs.nixpkgs.lib.fileset.toSource {
            root = ./.;
            fileset = inputs.nixpkgs.lib.fileset.unions [
              ./books.toml
              ./shared/kartei.py
              ./website
            ];
          };
          nativeBuildInputs = [
            pkgs.python3
            pkgs.poppler-utils
          ];
          buildPhase = ''
            runHook preBuild
            python3 shared/kartei.py website $out ${books}
            runHook postBuild
          '';
          dontInstall = true;
        };

      shell =
        pkgs:
        let
          t = toolchain pkgs;
        in
        pkgs.mkShell ({ inherit (t) packages; } // t.env);
    in
    {
      packages = builtins.mapAttrs (
        system: pkgs:
        let
          built = inputs.nixpkgs.lib.genAttrs books (name: book (pkgsFor system name) name);
          all = pkgs.linkFarm "books" built;
        in
        built
        // {
          default = all;
          website = website pkgs all;
        }
      ) inputs.nixpkgs.legacyPackages;

      devShells = builtins.mapAttrs (
        system: pkgs:
        inputs.nixpkgs.lib.genAttrs books (name: shell (pkgsFor system name))
        // {
          default = shell pkgs;
        }
      ) inputs.nixpkgs.legacyPackages;
    };
}
