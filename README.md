# nixos-i3

nixos-i3 = fetchGit {
	url = "https://github.com/typovrak/nixos-i3.git";
	ref = "main";
};

(import "${nixos-i3}/configuration.nix")
