class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.2.8"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.8_arm64.tar.gz"
    sha256 "e1595f6da2ecaed35859933f51afc3b512895869fedc0f96ac7c14682f856d9a"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.2.8_amd64.tar.gz"
    sha256 "25f88e37f5542dff95847b2e37f381f8c61de9c0ece95a3f3332a382fc368ddb"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
