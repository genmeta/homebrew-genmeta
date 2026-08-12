class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.8.1"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "4626ee75ce084523f4a7ca768e9e3c8d2bafcd3cafde9a59c47bc38e50e465d8"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "71b06e35c5a3223e4f6fe9b10d9058249828f2ce681761199a4ff61c774cc7cf"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
