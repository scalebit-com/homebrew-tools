class Cabidl < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.6.0/cabidl-0.6.0-macos-arm64.tar.gz"
      sha256 "894d04406c434bf5ae86d2e2317aff5576ab1164bdc69733272da739605f8fef"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.6.0/cabidl-0.6.0-macos-x86_64.tar.gz"
      sha256 "62ac49a5d7f88b3e78091e6c218cfcb2ff07b89d8dbbee11d6180d8ba19a70e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.6.0/cabidl-0.6.0-linux-arm64.tar.gz"
      sha256 "9566abd944dc43172cb048093c897e6a3b04b60d6b32c0b87179af1f3da2ef74"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.6.0/cabidl-0.6.0-linux-x86_64.tar.gz"
      sha256 "a2a97da8a9d5221487ca0da41637206bab432184f8667fbe611f10faa70812ae"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
