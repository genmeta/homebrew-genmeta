class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.4.1"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.1_arm64.tar.gz"
    sha256 "36f441052efd5804f55267a3a9e0f0b5aff503407f3c778130d487d0b024c35e"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.1_amd64.tar.gz"
    sha256 "267a97d002854612d5bc2c3a0783bad4d42e40e4318a85d595d484bcac9cd8e9"
  end
  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/gmutils", "-V"
  end

end
