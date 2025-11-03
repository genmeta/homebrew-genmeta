class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.4.2"
  homepage "www.genmeta.net"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.2_arm64.tar.gz"
    sha256 "b48e99da51448de9a4553a91e6cbacb947e54bc011042e373aff3ced47915bb2"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.2_amd64.tar.gz"
    sha256 "12b3fa08b10fe39cf74b1cf3a0845d1f8cf54d6183833e3e90703fa6b2a0b471"
  end
  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/gmutils", "-V"
  end

end
