class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.6.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/brew/gmutils/gmutils-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "31c8b24cdd65a2c03024f3f010809cd1a02db6e702eacfa657903c87e11419a6"
  end

  on_intel do
    url "https://download.dhttp.net/brew/gmutils/gmutils-0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "dc142bfba0ce73f70d9e4a0bdc616be07dc54de528815d9cc4f6dc69ec516f3e"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
