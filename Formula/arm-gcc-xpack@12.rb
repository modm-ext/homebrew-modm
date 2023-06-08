class ArmGccXpackAT12 < Formula
  @arch = if Hardware::CPU.arm?
    "arm64"
  else
    "x64"
  end

  @sha = if Hardware::CPU.arm?
    "15047b5ee4ab6e739401ffcf1238003f67d83129919d81c0c61989be09d95e62"
  else
    "5b4d2d3c6b258b275eee06a3437b9f04480957e8415c6c9f00b56a7cc5f2c01f"
  end

  version "12.2.1-1.2"
  sha256 @sha
  url "https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v#{version}/xpack-arm-none-eabi-gcc-#{version}-darwin-#{@arch}.tar.gz"
  desc "The xPack GNU Arm Embedded GCC - binary distribution of GNU Arm Embedded GCC"
  homepage "https://xpack.github.io/dev-tools/arm-none-eabi-gcc/"

  def install
    prefix.install Dir["arm-none-eabi", "include", "libexec", "share", "bin"]
    lib.install "lib/libcc1.so", "lib/libcc1.0.so", "lib/gcc", "lib/bfd-plugins"
  end
end
