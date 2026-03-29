class CabidlAT05 < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.5.0/cabidl-0.5.0-macos-arm64.tar.gz"
      sha256 "40a34c4ec2ee865050e35b047fa64df192fac69e9b80779987eb61453622af04"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.5.0/cabidl-0.5.0-macos-x86_64.tar.gz"
      sha256 "271f01266708c17b9d3e537aea7c365124381abdaa3fe4393da32d35090ab2b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.5.0/cabidl-0.5.0-linux-arm64.tar.gz"
      sha256 "9ae402894159e625f1242ce52746249ce2ee8375d12b04ca0b2282967365279f"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.5.0/cabidl-0.5.0-linux-x86_64.tar.gz"
      sha256 "4f03d0547d7f114db7a2b807c128d7e4e9643ff0f287f6cbb9b5176477b75ea2"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
