class OpenocdStmicro < Formula
  desc "STMicroelectronics fork of OpenOCD with better STM32 support"
  homepage "https://openocd.org/"
  url "https://github.com/stmicroelectronics/openocd.git", branch: "openocd-cubeide-r7"
  version "cubeide-r7"
  license "GPL-2.0-or-later"
  revision 1

  head "https://github.com/stmicroelectronics/openocd.git"

  # Dependencies required to build from source/git
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "texinfo" => :build
  depends_on "pkgconf" => :build

  depends_on "capstone"
  depends_on "hidapi"
  depends_on "libftdi"
  depends_on "libusb"

  def install
    ENV["CCACHE"] = "none"

    system "./bootstrap", "nosubmodule"
    system "./configure", "--enable-buspirate",
                          "--enable-stlink",
                          "--enable-dummy",
                          "--enable-jtag_vpi",
                          "--enable-remote-bitbang",
                          *std_configure_args
    system "make", "install"
  end
end
