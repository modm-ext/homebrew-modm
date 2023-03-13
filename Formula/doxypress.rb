require 'formula'

class Doxypress < Formula
    desc 'DoxyPress: C++ documentation generator'
    homepage 'https://www.copperspice.com/documentation-doxypress.html'

    url 'https://github.com/copperspice/doxypress/releases/download/dp-1.5.1/doxypress-1.5.1-osx11.5-x64.tar.bz2'

    sha256 'fb99bbf39775c5a56873b181125d1b2127ba2c24eb1c212c0071c76abf831a03'
    version '1.5.1'

    def install
        bin.install "doxypress"
        lib.install Dir["*.dylib"]
    end
end
