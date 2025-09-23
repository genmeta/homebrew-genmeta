class Pishoo < Formula
  desc "Pishoo (\"Prosperity Guardian Beast\") is a powerful proxy server optimized for HTTP/3 and end-to-end encrypted communication. Built for privacy and security scenarios, it seamlessly functions as both a forward proxy for client privacy and a reverse proxy to streamline traffic between edge networks and backend services. Its architecture is designed to safeguard your data from infringement and ensures that it can be accessed and utilized securely."
  version "0.4.0"

  on_arm do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.0_arm64.tar.gz"
    sha256 "e6f627150ae0b05d2a3a2d7346988bc9009aa2493e35dd1478aef335255fcd92"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.0_amd64.tar.gz"
    sha256 "2504526543ec6652b2148f82de766eaa7e8457120c0854d97fe55ef8edb20527"
  end
  def install
    bin.install "pishoo"

    (etc/"pishoo").mkpath
    chmod 0755, etc/"pishoo"
    etc.install "pishoo.conf" => "pishoo/pishoo.conf" unless File.exist? "#{etc}/pishoo/pishoo.conf"
    etc.install "mime.types"  => "pishoo/mime.types"  unless File.exist? "#{etc}/pishoo/mime.types"

    (etc/"pishoo/ssl").mkpath
    chmod 0700, etc/"pishoo/ssl"

    (etc/"pishoo/acl").mkpath
    chmod 0700, etc/"pishoo/acl"
    touch etc/"pishoo/acl/rules.db"
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
