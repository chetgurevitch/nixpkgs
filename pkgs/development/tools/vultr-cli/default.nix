{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "vultr-cli";
  version = "2.18.2";

  src = fetchFromGitHub {
    owner = "vultr";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-RW8t5s28eUxHKEz+UHdeHlRMYprKlA9AdtiEy661des=";
  };

  vendorHash = "sha256-61hdhkFyp4an9KtqDzB4Sd2+t40QEoLgq7MvUBxEQKs=";

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Official command line tool for Vultr services";
    homepage = "https://github.com/vultr/vultr-cli";
    changelog = "https://github.com/vultr/vultr-cli/blob/v${version}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ Br1ght0ne ];
  };
}
