{
  pkgs,
  work,
  ...
}:
{
  imports = [
    ./../common/home.nix
    ./../work-common/home.nix
  ];

  home = {
    homeDirectory = "/home/${work.user}";
    packages = with pkgs; [

    ];
  };

}
