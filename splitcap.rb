require "formula"

class Splitcap < Formula
  homepage "http://www.netresec.com/?page=SplitCap"
  url "http://downloads.sourceforge.net/project/splitcap/SplitCap%202.1/SplitCap_2-1.zip"
  sha1 "efb3df82f49d7354abe959be8c9e63d3f20413cb"
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
