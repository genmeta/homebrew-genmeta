class Pishoo < Formula
  desc "Pishoo (\"Prosperity Guardian Beast\") is a powerful proxy server optimized for HTTP/3 and end-to-end encrypted communication. Built for privacy and security scenarios, it seamlessly functions as both a forward proxy for client privacy and a reverse proxy to streamline traffic between edge networks and backend services. Its architecture is designed to safeguard your data from infringement and ensures that it can be accessed and utilized securely."
  version "0.4.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.0_arm64.tar.gz"
    sha256 "7c536bd9aab9411817de6e30b79e575ac596d2b0f1edee5135e6c6dea25d1912"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.0_amd64.tar.gz"
    sha256 "067b2cd2eea277db68f8092408d34e7d3060e52c69d0038e5e5e02efd82fea5a"
  end

  def install
    bin.install "pishoo"

    (etc/"pishoo").mkpath
    etc.install "pishoo.conf" => "pishoo/pishoo.conf" unless File.exist? "#{etc}/pishoo/pishoo.conf"
    etc.install "mime.types"  => "pishoo/mime.types"  unless File.exist? "#{etc}/pishoo/mime.types"
    (etc/"pishoo/ssl").mkpath
    (etc/"pishoo/acl").mkpath
    touch etc/"pishoo/acl/rules.db"
  end

  def post_install
    chmod 0755, etc/"pishoo"
    chmod 0600, etc/"pishoo/ssl"
    chmod 0644, etc/"pishoo/pishoo.conf"
    chmod 0600, etc/"pishoo/acl"
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/pishoo/pishoo.conf

      The SSL certificates should be placed in:
        #{etc}/pishoo/ssl/
    
      Empty access rule database file created at:
        #{etc}/pishoo/acl/rules.db
      You can install `access` to configure firewall rules
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