class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.2.6"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.6_arm64.tar.gz"
    sha256 "d0060cd4f89a9ec8ddcfd1fa8a23e621c87ab10b88d8fc699b0bb5d24e6fbce5"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.6_amd64.tar.gz"
    sha256 "6022104f17606ae710d3265af357c039e46ff2e8f21182aabde95168fffa957c"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
