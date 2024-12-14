require 'formula'

class Doxypress < Formula
    desc 'DoxyPress: C++ documentation generator'
    homepage 'https://www.copperspice.com/documentation-doxypress.html'

    url 'https://github.com/copperspice/doxypress/releases/download/dp-1.7.0/doxypress-1.7.0-osx11.5-x64.tar.bz2'

    sha256 'e0c36769c471cfa50116ebac091d997cd069c43a35755537a5b60da391e2fa3e'
    version '1.7.0'

    def install
        bin.install "doxypress"
        lib.install Dir["*.dylib"]
    end
end
