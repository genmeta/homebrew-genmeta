class Pishoo < Formula
  desc "Pishoo (\"Prosperity Guardian Beast\") is a powerful proxy server optimized for HTTP/3 and end-to-end encrypted communication. Built for privacy and security scenarios, it seamlessly functions as both a forward proxy for client privacy and a reverse proxy to streamline traffic between edge networks and backend services. Its architecture is designed to safeguard your data from infringement and ensures that it can be accessed and utilized securely."
  version "0.2.6"

  on_arm do
    url "https://download.genmeta.net/homebrew/pishoo_0.2.6_arm64.tar.gz"
    sha256 "bed1707b0e5f1417f637a7eb109e33f5e14bcb2debee0d396260798bb4e6f192"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/pishoo_0.2.6_amd64.tar.gz"
    sha256 "49ee994c3b97c2c06366f2c714221a139edb21f68acb4a6c036241f3c25c52d0"
  end

  def install
    bin.install "pishoo"
    
    (etc/"pishoo").mkpath
    
    etc.install "pishoo.conf" => "pishoo/pishoo.conf" unless File.exist? "#{etc}/pishoo/pishoo.conf"
    
    (etc/"pishoo/ssl").mkpath
  end

  def post_install
    chmod 0755, etc/"pishoo"
    chmod 0755, etc/"pishoo/ssl" 
    chmod 0644, etc/"pishoo/pishoo.conf" if File.exist? "#{etc}/pishoo/pishoo.conf"
  end

  def caveats
    <<~EOS
      Configuration files are installed at:
        #{etc}/pishoo/pishoo.conf
      
      The SSL certificates should be placed in:
        #{etc}/pishoo/ssl/
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
