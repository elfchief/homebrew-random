require "formula"

class Splitcap < Formula
  homepage "http://www.netresec.com/?page=SplitCap"
  url "http://downloads.sourceforge.net/project/splitcap/SplitCap%202.1/SplitCap_2-1.zip"
  sha256 "426fc70a6e3f42fc7972ec04d312ded6cf22f8935b47e8f3cf1b708f1212695a"
  version "2.1"

  depends_on "mono"

  def install
    scr = (bin/"splitcap")
    scr.write("#!/bin/sh\n#{Formula["mono"].bin}/mono #{libexec}/SplitCap.exe \"$@\"\n")

    libexec.install "PcapFileHandler.dll", "SplitCap.exe", "NetworkWrapper.dll", "PacketParser.dll"
  end

  test do
    # Don't really know how to test this
    system "true"
  end
end
