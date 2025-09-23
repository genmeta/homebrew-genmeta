class Access < Formula
  desc "A modern firewall that controls access to domains and resources"
  version "0.1.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/access_0.1.0_arm64.tar.gz"
    sha256 "b4e26270ff15f7b9afb6403289a380fcecfbe276bd52a321fe8852f6246a5f77"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/access_0.1.0_amd64.tar.gz"
    sha256 "ca6000f3cc20451bd4186c315155be7c93ca30e869dc3dc5ad3fe3fc9ff44fe1"
  end
  def install
    bin.install "access"
  end

  test do
    system "#{bin}/access", "-V"
  end

end
