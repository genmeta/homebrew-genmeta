class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.7.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/pishoo_0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "eb75dabc0a8e4b98cb81f7031bdf08c7c6682cc39cc5cb7f994aa3dcd901f981"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/pishoo_0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "4c0fd9b4d82661a5eba62b2ee097997612ea4b4a420796b540628ec66b76bbfa"
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

  def post_install
    return if system("/usr/bin/dscl", ".", "-read", "/Groups/pishoo", out: File::NULL, err: File::NULL)

    if Process.uid.zero?
      system "/usr/sbin/dseditgroup", "-o", "create", "pishoo"
    else
      opoo "pishoo group was not found; create it with: sudo dseditgroup -o create pishoo"
    end
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/dhttp/pishoo.conf

      In default global-home mode, missing workers/groups makes pishoo load users in the pishoo group.
      If the pishoo group was not created automatically, run:
        sudo dseditgroup -o create pishoo
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
