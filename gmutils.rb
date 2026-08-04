class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.8.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "dc9fcb719c37cf3b852a99a82dd8af79b32c42be0ce1c1391a5ff1d41d9bf444"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "592fe68b5cef56f7683bfd53230f816688c59bd1d924d757ccef6c0db40545e6"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
