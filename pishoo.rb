class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.6.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/brew/pishoo/pishoo_0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "d704e597d5d4b1d0e8f276ca4a916f4fe20af5ec65a280c6b4e6deea8ae43851"
  end

  on_intel do
    url "https://download.dhttp.net/brew/pishoo/pishoo_0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "01befb13e9ddb131abbd51f8ab6a06335055ea7e418376fc8afca1427a9c2ae3"
  end

  def install
    bin.install "pishoo"
    libexec.install "pishoo-worker"
    libexec.install "pishoo-ssh-session"

    (etc/"pishoo").mkpath
    chmod 0755, etc/"pishoo"
    etc.install "pishoo.conf" => "pishoo/pishoo.conf" unless File.exist? "#{etc}/pishoo/pishoo.conf"
    etc.install "mime.types"  => "pishoo/mime.types"  unless File.exist? "#{etc}/pishoo/mime.types"
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/pishoo/pishoo.conf
    EOS
  end

  service do
    run [opt_bin/"pishoo", "-c", etc/"pishoo/pishoo.conf"]
    keep_alive true
    log_path var/"log/pishoo.log"
    error_log_path var/"log/pishoo.error.log"
    working_dir HOMEBREW_PREFIX
  end

  test do
    system "#{bin}/pishoo", "-V"
  end
end
