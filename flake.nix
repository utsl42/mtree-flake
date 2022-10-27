{
  description = "portable version of NetBSD mtree";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
      overlay = self: super: { };
      pkgsForSystem = system: (import nixpkgs {
        inherit system;
        overlays = [
          self.overlays.default
        ];
      });
    in
    {
      overlays.default = final: prev: {
        libnbcompat = prev.callPackage ./libnbcompat/default.nix { };
        mtree = final.callPackage ./mtree/default.nix { };
      };
      packages = forAllSystems
        (system:
          let
            pkgs = pkgsForSystem system;
          in
          {
            libnbcompat = pkgs.libnbcompat;
            mtree = pkgs.mtree;
            default = pkgs.mtree;
          });
    };
}
