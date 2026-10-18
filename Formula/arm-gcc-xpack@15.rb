class ArmGccXpackAT15 < Formula
  desc "The xPack GNU Arm Embedded GCC - binary distribution of GNU Arm Embedded GCC"
  homepage "https://xpack.github.io/dev-tools/arm-none-eabi-gcc/"
  version "15.2.1-1.1"

  on_arm do
    url "https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v15.2.1-1.1/xpack-arm-none-eabi-gcc-15.2.1-1.1-darwin-arm64.tar.gz"
    sha256 "574082d35e49a2bcbdc355836b2a3ae5e5bb3b9456c9f5e37177db2ab4aad870"
  end
  on_intel do
    url "https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v15.2.1-1.1/xpack-arm-none-eabi-gcc-15.2.1-1.1-darwin-x64.tar.gz"
    sha256 "5be906a5194c3173e145a58048e5607ffff947773237802b93e55e23c415f1b6"
  end

  keg_only <<~KEG_ONLY_EOS
    it may interfere with another version of arm-gcc-bin or arm-gcc-xpack.
    This is useful if you want to have multiple versions installed
  KEG_ONLY_EOS

  def install
    # arm-none-eabi-gdb-py3 embeds Python and needs the bundled lib/python3.13
    # next to it. Keep the whole tree private in libexec, so that the bundled
    # Python is not linked into the Homebrew prefix where it breaks other Pythons.
    libexec.install Dir["*"]
    bin.install_symlink (Dir[libexec/"bin/*"] - [(libexec/"bin/arm-none-eabi-gdb").to_s])
    # The plain arm-none-eabi-gdb has no Python, but modm tools call it by that name
    bin.install_symlink libexec/"bin/arm-none-eabi-gdb-py3" => "arm-none-eabi-gdb"
    bin.install_symlink libexec/"bin/arm-none-eabi-gdb-py3" => "arm-none-eabi-gdb-py"
  end

  test do
    (testpath/"test.c").write "int main(void) { return 0; }"
    system bin/"arm-none-eabi-gcc", "-mcpu=cortex-m4", "--specs=nosys.specs", "test.c", "-o", "test.elf"
    assert_match "ok", shell_output("#{bin}/arm-none-eabi-gdb -batch -ex 'python import ssl; print(\"ok\")'")
  end
end
