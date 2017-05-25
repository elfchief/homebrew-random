require "formula"

class Schemaspy < Formula
  homepage "http://schemaspy.sourceforge.net/"
  url "http://downloads.sourceforge.net/project/schemaspy/schemaspy/SchemaSpy%205.0.0/schemaSpy_5.0.0.jar"
  sha256 "4f46ec1647447a9282fd24db93ae797cf9d8f8ebef07f0e10c70ca41af6b9a43"
  version "5.0.0"

  depends_on "graphviz"

  # Wish I knew how to make the version into a variable that I can use 
  # everywhere, but I keep running into scoping problems, so not sure 
  # what to actually do with it. I should learn ruby.
  resource 'mysql-connector' do
    url "http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.zip"
    sha256 "3d3a7a71a9db437b15623c657b21ef029f4374b9b7c543103a745a56f1ab2b53"
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
