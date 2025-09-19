class Access < Formula
  desc "A modern firewall that controls access to domains and resources"
  version "0.1.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/access_0.1.0_arm64.tar.gz"
    sha256 "40ad4ebea59ec3366fca0ba1ed13e4473aa15eca00626dcd6de525420e5cef79"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/access_0.1.0_amd64.tar.gz"
    sha256 "7f19708a86823b7daa9efe5409f007aba1af0d6eb9c7b51a6bddafa7257f744f"
  end

  def install
    bin.install "access"
  end
end