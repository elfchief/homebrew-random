class NetalyzrCli < Formula
  desc "The ICSI Network Analyzer CLI Client"
  homepage "http://netalyzr.icsi.berkeley.edu/cli.html"
  url "http://netalyzr.icsi.berkeley.edu/NetalyzrCLI.jar"
  version "57861"
  sha256 "ab8362318231c01a265f020a09b7ede0dafdb8282084d382b3e11670df7e4339"


  def install
    libexec.install "NetalyzrCLI.jar"

    scr = (bin/"netalyzr-cli")
    scr.write <<~EOS
      #!/bin/sh
      exec java -jar #{libexec}/NetalyzrCLI.jar "$@"
    EOS
  end

  test do
    system "true"
  end
end
