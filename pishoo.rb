class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.8.1"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "2ab8a91cbcff750ae2c2b7ebf3a4d8e69c675adcc16dfac6f6211283a312245f"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "8fb04a98a80551a6243992ab38cd981b46aa82c09a8afc826a6bd5a404a081ac"
  end

  def install
    bin.install "pishoo"
    libexec.install "pishoo-worker"
    libexec.install "pishoo-ssh-session"


    (etc/"dhttp").mkpath
    chmod 0755, etc/"dhttp"
    etc.install "pishoo.conf" => "dhttp/pishoo.conf" unless File.exist? "#{etc}/dhttp/pishoo.conf"
    etc.install "mime.types"  => "dhttp/mime.types"  unless File.exist? "#{etc}/dhttp/mime.types"
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/dhttp/pishoo.conf

      On macOS, default global-home mode loads worker users from the existing _www group.
      This formula does not create or modify system groups. To opt the current user into
      default pishoo worker discovery, run:
        sudo dseditgroup -o edit -a "$USER" -t user _www
    EOS
  end

  service do
    run [opt_bin/"pishoo"]
    keep_alive true
    log_path var/"log/pishoo.log"
    error_log_path var/"log/pishoo.error.log"
    working_dir HOMEBREW_PREFIX
  end

  test do
    system "#{bin}/pishoo", "-V"
  end
end
