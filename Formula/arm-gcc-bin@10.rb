# frozen_string_literal: true

class ArmGccBinAT10 < Formula
  desc "Pre-built GNU toolchain for Arm Cortex-M and Cortex-R processors"
  homepage "https://gitlab.arm.com/tooling/gnu-toolchains-for-arm"
  url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-mac.tar.bz2"
  version "10.3-2021.10"
  sha256 "fb613dacb25149f140f73fe9ff6c380bb43328e6bf813473986e9127e2bc283b"

  revision 1

  def install
    bin.install Dir["bin/*"]
    prefix.install Dir["arm-none-eabi", "lib", "share"]
  end

  test do
    assert_match "GNU Arm Embedded Toolchain #{version}", shell_output("#{opt_prefix}/bin/arm-none-eabi-gcc --version")
  end
end
