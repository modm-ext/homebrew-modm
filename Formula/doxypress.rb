class Doxypress < Formula
  desc "DoxyPress: C++ documentation generator (with modm performance patches)"
  homepage "https://www.copperspice.com/documentation-doxypress.html"
  # dp-2.1.0 plus the perf/modm branch
  url "https://github.com/salkinium/doxypress/archive/5d6050520e9f4ff547de0e140d51d94a58948c16.tar.gz"
  version "2.1.0-modm"
  sha256 "06f4939933bedd036661088a7c9de2c437d71f308cf38d71d478db9565af099f"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "llvm@20"
  depends_on :macos

  # CopperSpice is not packaged in Homebrew, use the upstream binary release
  resource "copperspice" do
    on_arm do
      url "https://github.com/copperspice/copperspice/releases/download/cs-2.1.0/copperspice-2.1.0-osx15.1-arm64.tar.bz2"
      sha256 "66b3978ce2f8a8230493f0a06e92fb3fd87e2a1426261d0d0fa847398525dc64"
    end
    on_intel do
      url "https://github.com/copperspice/copperspice/releases/download/cs-2.1.0/copperspice-2.1.0-osx14.7.4-x64.tar.bz2"
      sha256 "40df60858cf3c0fcb75878758a516675c3a8bf6b534c275916fa9f6245565fe8"
    end
  end

  def install
    (buildpath/"copperspice").install resource("copperspice")
    # The CMake targets hardcode libz from the SDK CopperSpice was built with
    inreplace "copperspice/CopperSpice.framework/Resources/CopperSpiceLibraryTargets.cmake",
              %r{"[^"]*/usr/lib/libz\.tbd"}, '"z"'

    # Use the Homebrew LLVM dylibs instead of the bundled static clang libs
    llvm = Formula["llvm@20"]
    (buildpath/"clang_lib").mkpath
    ln_s llvm.opt_include, buildpath/"clang_lib/include"
    ln_s llvm.opt_lib, buildpath/"clang_lib/lib"
    inreplace "src/CMakeLists.txt", /(-lclang\n).*?-lLLVMWindowsDriver\n/m, "\\1-lclang-cpp\n-lLLVM\n"
    # clang 19+ returns a TemplateArgumentLoc for the default argument
    inreplace "src/parse_lib_tooling.cpp", "toQString(node->getDefaultArgument())",
              "toQString(node->getDefaultArgument().getArgument().getAsType())"

    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja",
           "-DCMAKE_PREFIX_PATH=#{buildpath}/copperspice",
           "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON",
           *std_cmake_args
    system "cmake", "--build", "build"

    libexec.install "build/bin/doxypress"
    libexec.install Dir["copperspice/lib/libCs{Core,Xml}2.1.dylib"]
    bin.install_symlink libexec/"doxypress"
  end

  test do
    assert_match version.to_s.delete_suffix("-modm"), shell_output("#{bin}/doxypress --version")
  end
end
