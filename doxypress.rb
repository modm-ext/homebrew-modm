require 'formula'

class Doxypress < Formula
    desc 'DoxyPress: C++ documentation generator'
    homepage 'https://www.copperspice.com/documentation-doxypress.html'

    url 'https://github.com/copperspice/doxypress/releases/download/dp-1.4.2/doxypress-1.4.2-osx10.16-x64.tar.bz2'

    sha256 '13eaec9e313f8212c6c8f8b61fabfc225c960f23fa383807277a93e7eb4cf869'
    version '1.4.2'

    def install
        bin.install "doxypress"
        lib.install Dir["*.dylib"]
    end
end
