class CabidlAT01 < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.1.1/cabidl-0.1.1-macos-arm64.tar.gz"
      sha256 "238db9f1424329e2c5ac4dd851070196da7011c0764fb96d73249dc230bdd012"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.1.1/cabidl-0.1.1-macos-x86_64.tar.gz"
      sha256 "c79070eceeb61fd22a85935c6a53adef22a6376e0f36fc8f163e4a5583c2a4a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.1.1/cabidl-0.1.1-linux-arm64.tar.gz"
      sha256 "cde4f6609209f5ca02137d29a342b1a9c2052d8d9f219744af86bd454307784d"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.1.1/cabidl-0.1.1-linux-x86_64.tar.gz"
      sha256 "cc4c496721eeedc7a3222dc38d3319cadb18567fd1da73684e7f57df2f7e3c40"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
