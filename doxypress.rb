require 'formula'

class Doxypress < Formula
    desc 'DoxyPress: C++ documentation generator'
    homepage 'https://www.copperspice.com/documentation-doxypress.html'

    url 'https://download.copperspice.com/doxypress/binary/doxypress-1.4.0-osx10.14-x64.tar.bz2'

    sha256 '63a5e21f0d9649fc264dd45d538fb206e0b8d838460dcbc2cbbf73382fe8d9b7'
    version '1.4.0'

    def install
        bin.install "doxypress"
        lib.install Dir["*.dylib"]
    end
end
