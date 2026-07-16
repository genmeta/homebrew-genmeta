class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.7.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "a85cf0d022ab7a748c8d0d4359a8ed9c6c4b134eae5bc3f9350a4cad85d1a03b"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "3f7a9ba797a9ee99faa033f8f128abcfa5e0696a49aeb04166f99e032f447f2e"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
