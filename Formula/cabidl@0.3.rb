class CabidlAT03 < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.3.0/cabidl-0.3.0-macos-arm64.tar.gz"
      sha256 "0422a0d9bfcbcb099bc37b394e0d8277f4984ec36cd51a69edaf06982962a92f"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.3.0/cabidl-0.3.0-macos-x86_64.tar.gz"
      sha256 "1dc3b3922b3e1fe02bf749c00996c1ef4c7f6cdb94be99c52654e43afe884681"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.3.0/cabidl-0.3.0-linux-arm64.tar.gz"
      sha256 "c6b35d28b22d1ccd73590b25ac2f1934f8176ece62c2bb17b51ef50aed0ac457"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.3.0/cabidl-0.3.0-linux-x86_64.tar.gz"
      sha256 "4b3900dbce6dce2b3a4e636b909f05c48ab303e245f243cbbf8d60b75dd4400a"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
