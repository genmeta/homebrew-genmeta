class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.2.4"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.4_arm64.tar.gz"
    sha256 "5b6fa55c74ba9df232f10cd35442fd84666ccee0926b4d1dda56c1da3fe83bc4"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.4_amd64.tar.gz"
    sha256 "9f70642ba29d6d2234063e59177c5605beaeb1bad99d7a248ba2aae87f701cb5"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
