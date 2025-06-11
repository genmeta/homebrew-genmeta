class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.2.7"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.7_arm64.tar.gz"
    sha256 "b92193642d44e139ef4fc81e1bd8d053616dcc4cd8bdbb21038d6dc248c04df7"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.7_amd64.tar.gz"
    sha256 "2206626b28375255d5a6a2c825efe21133a69d6e304aaeecd9a3af7dc7a0e489"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
