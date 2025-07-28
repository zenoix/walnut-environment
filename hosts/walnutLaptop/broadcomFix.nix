# This is a UNSAFE workaround for the insecure and unmaintained broadcom wifi drivers my laptop needs

{ lib, ... }:
{
  nixpkgs.config = {
    allowInsecurePredicate = pkgs: builtins.elem (lib.getName pkgs) [ "broadcom-sta" ];
  };
}
