class Pishoo < Formula
  desc "Pishoo (\"Prosperity Guardian Beast\") is a powerful proxy server optimized for HTTP/3 and end-to-end encrypted communication. Built for privacy and security scenarios, it seamlessly functions as both a forward proxy for client privacy and a reverse proxy to streamline traffic between edge networks and backend services. Its architecture is designed to safeguard your data from infringement and ensures that it can be accessed and utilized securely."
  version "0.2.7"

  on_arm do
    url "https://download.genmeta.net/homebrew/pishoo_0.2.7_arm64.tar.gz"
    sha256 "3ab9948ab742a10fbed3ae233d8224d90e5c56e9834756ff9abf1bac832684fb"
  end
  
  on_intel do
    url "https://download.genmeta.net/homebrew/pishoo_0.2.7_amd64.tar.gz"
    sha256 "22e2995184fc455e69dd7fb7e0cb137afddd589f11a1e6a10ef8a340a4af8c71"
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
