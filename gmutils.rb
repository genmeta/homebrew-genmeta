class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.2.5"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.5_arm64.tar.gz"
    sha256 "92cdb07a8764fa2f6b903e8fcd6496060d51eb9c9c1e864ba8f065f983e08406"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.5_amd64.tar.gz"
    sha256 "07f56bb01b41f283e7d93a2a1ccce515573178f9fbc776e36bc73103939cfc16"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
