require "formula"

class Schemaspy < Formula
  homepage "http://schemaspy.sourceforge.net/"
  url "http://downloads.sourceforge.net/project/schemaspy/schemaspy/SchemaSpy%205.0.0/schemaSpy_5.0.0.jar"
  sha1 "6666f6861e63a6f3061cd68e402cea9b094d1e98"
  version "5.0.0"

  depends_on "graphviz"

  # Wish I knew how to make the version into a variable that I can use 
  # everywhere, but I keep running into scoping problems, so not sure 
  # what to actually do with it. I should learn ruby.
  resource 'mysql-connector' do
    url "http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.zip"
    sha1 "8019fbc4b00c7c3af91b90c893fd64c011c02af9"
  end

  def install
    libexec.install resource("mysql-connector").files("mysql-connector-java-5.1.30-bin.jar")
    libexec.install "schemaSpy_#{version}.jar"

    scr = (bin/"schemaspy")
    scr.write <<-EOS.undent
      #!/bin/sh
      exec java -jar #{libexec}/schemaSpy_#{version}.jar -t mysql -dp #{libexec}/mysql-connector-java-5.1.30-bin.jar "$@"
    EOS
  end

  test do
    # Not sure how to test this
    system "true"
  end
end
