class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.4.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.0_arm64.tar.gz"
    sha256 "7c369bf124bd254aa147c770a24f2283416f31e852afe72510347897afa89248"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.0_amd64.tar.gz"
    sha256 "c7e4d8e099e9a9bd2c0422118faf39bddd06fc84defb62f5ac887abb1e727584"
  end
  def install
    bin.install "genmeta"
  end

  test do
    system "#{bin}/gmutils", "-V"
  end

end
