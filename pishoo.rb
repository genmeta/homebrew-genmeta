class Pishoo < Formula
  desc "Pishoo (\"Prosperity Guardian Beast\") is a powerful proxy server optimized for HTTP/3 and end-to-end encrypted communication. Built for privacy and security scenarios, it seamlessly functions as both a forward proxy for client privacy and a reverse proxy to streamline traffic between edge networks and backend services. Its architecture is designed to safeguard your data from infringement and ensures that it can be accessed and utilized securely."
  version "0.4.1"

  on_arm do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.1_arm64.tar.gz"
    sha256 "34a3ae02a4f5ea67d0ed64d237f8d014130a61caea9fc347f21916ac62f19bdc"
  end

  on_intel do
    url "https://download.genmeta.net/homebrew/pishoo_0.4.1_amd64.tar.gz"
    sha256 "4776b73e3aa1e946389de5278146cc811ed4387703a43173589d2c15aa41e43d"
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
    begin
      touch etc/"pishoo/acl/rules.db"
    rescue
      opoo "Failed to initial access rule database at #{etc}/pishoo/acl/rules.db. If this is not the first installation, this warning can be ignored."
    end
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/pishoo/pishoo.conf

      The SSL certificates should be placed in:
        #{etc}/pishoo/ssl/
    
      For the firest install, empty access rule database file created at:
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
