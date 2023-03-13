require 'formula'

class ArmGccXpackAT12 < Formula
    @tar_file = if Hardware::CPU.arm?
        "xpack-arm-none-eabi-gcc-12.2.1-1.2-darwin-arm64.tar.gz"
    else
        "xpack-arm-none-eabi-gcc-12.2.1-1.2-darwin-x64.tar.gz"
    end

    @tar_file_sha = if Hardware::CPU.arm?
        "15047b5ee4ab6e739401ffcf1238003f67d83129919d81c0c61989be09d95e62"
    else
        "5b4d2d3c6b258b275eee06a3437b9f04480957e8415c6c9f00b56a7cc5f2c01f"
    end

    desc "The xPack GNU Arm Embedded GCC - binary distribution of GNU Arm Embedded GCC"
    homepage "https://xpack.github.io/dev-tools/arm-none-eabi-gcc/"

    url "https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v12.2.1-1.2//#{@tar_file}"
    version "12.2.Rel1"

    sha256 @tar_file_sha

    def install
        bin.install Dir["bin/*"]
        prefix.install Dir["arm-none-eabi", "include", "lib", "libexec", "share"]
    end
end
