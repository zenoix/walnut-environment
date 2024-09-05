{ pkgs, ... }: {
	programs.starship = {
		enable = true;
		enableZshIntegration = true;
		settings = pkgs.lib.importTOML ./starship.toml;
	};
}
