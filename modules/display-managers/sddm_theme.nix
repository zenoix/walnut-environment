{ pkgs, ... }:
let
  img_path = ../../assets/tokyo_train.jpg;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-flower-theme";
    rev = "5981c873c203136b59da9ed941139abea1aaa02b";
    sha256 = "sha256-6jkKYBQF385k9mexenFsDUfMv2Ig7M3RRdTTIOZuX2s=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    cp -r ${img_path} $out/Backgrounds/background.jpg
    sed -i 's/Background=\"Backgrounds\/background.png\"/Background=\"Backgrounds\/background.jpg\"/' ./theme.conf
    sed -i 's/ScreenWidth=\"1920\"/ScreenWidth=\"1440\"/' ./theme.conf
    sed -i 's/ScreenHeight=\"1080\"/ScreenWidth=\"900\"/' ./theme.conf
    sed -i 's/DimBackgroundImage=\"0.0\"/DimBackgroundImage=\"0.6\"/' ./theme.conf
    sed -i 's/AccentColor=\"#d4a067\"/AccentColor=\"#a6e3a1\"/' ./theme.conf
  '';
}
