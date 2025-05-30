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
    username = "${work.user}";
    homeDirectory = "/home/${work.user}";

    packages = with pkgs; [

    ];
  };

}
