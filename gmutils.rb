class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.3.1"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.3.1_arm64.tar.gz"
    sha256 "72756ffd27a10665f5bd2a1b0d81454ae1b093354bad46f2ec286c2b04ce1e46"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.3.1_amd64.tar.gz"
    sha256 "0d7b0258130a5631243ac49d75115382d09c864eee676629b9504959b1887d9d"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
