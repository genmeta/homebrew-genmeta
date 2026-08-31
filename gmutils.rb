class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.8.2"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "0d7d74d24d76be6e79c46a4489937a0ba0a0373ee77dce531b37e00ad9009011"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "779b85a6205c1d53b98f675932fe272b0c26d3cddc522f1ad5865d3282a26568"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
