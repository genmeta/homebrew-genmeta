class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.5.0"
  license "Shareware"

  on_arm do
    url "https://download.genmeta.net/homebrew/gmutils-0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "398dfe39935cc6fae5da6edaeedf0bba53d5550c68f65876b57727e6e0f26696"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/gmutils-0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "129744cb509c430336e1432892727c4795752fedb84fd13a8ffd3893a58fcc73"
  end

  def install
    bin.install "genmeta"
    bin.install "genmeta-ssh.sh"
  end

  test do
    system "#{bin}/genmeta", "version"
  end
end
