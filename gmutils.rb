class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.3.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.3.0_arm64.tar.gz"
    sha256 "b429aa8ed7171c6de7fcb98fd4088637c64f14775701e346b56311b4b202f931"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.3.0_amd64.tar.gz"
    sha256 "4ce737236de67f9742152d57505c1de8fa89a28fe899086e181657fe8e8b9a49"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end
