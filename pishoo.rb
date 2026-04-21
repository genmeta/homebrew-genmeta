class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.5.0"
  license "Shareware"

  on_arm do
    url "https://download.dhttp.net/homebrew/pishoo_0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "23a09012936610e2f19130ce13c79fb73e9e7c4f7c4ecb9e8d69b6792eb4e2cd"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/pishoo_0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "c873c4b5bf1e2a379e5fa2fb792eb348f027f374c0ff9cf87793e25f9e305d56"
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
