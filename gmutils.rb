class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.4.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.0_arm64.tar.gz"
    sha256 "35901cb055db5e519f88b9cf394b44c4ca34c3d9a0fda504e495c22cc2dd7cfb"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils_0.4.0_amd64.tar.gz"
    sha256 "4046d4a2ee6d043ea1ce993d9f906c019c501bda0d418a0381f65b25b326a221"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh3.sh"
  end

  test do
    system "#{bin}/genmeta", "--version"
  end
end