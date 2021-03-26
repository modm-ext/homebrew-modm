require 'formula'

class Doxypress < Formula
    desc 'DoxyPress: C++ documentation generator'
    homepage 'https://www.copperspice.com/documentation-doxypress.html'

    url 'https://download.copperspice.com/doxypress/binary/doxypress-1.4.1-osx10.14-x64.tar.bz2'

    sha256 'd50bf9c65c5dd6c02b58a4fe4ecc6ad570404bb45ab55f4e71ef4d42b7cd7b2f'
    version '1.4.1'

    def install
        bin.install "doxypress"
        lib.install Dir["*.dylib"]
    end
end
