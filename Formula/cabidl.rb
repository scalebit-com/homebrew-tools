class Cabidl < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.2.0/cabidl-0.2.0-macos-arm64.tar.gz"
      sha256 "29df2d27667d52d8433bdf2309b44bcc853e7fdcf8839d9c3a056ceface6a17b"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.2.0/cabidl-0.2.0-macos-x86_64.tar.gz"
      sha256 "896e1ec585fa3d36ccb2db373c56467c4a4bcfbfb1999afa0b2d749293cf8c2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.2.0/cabidl-0.2.0-linux-arm64.tar.gz"
      sha256 "06364e538a55022b94ec28ff004b7488589afd7b407aceba1ff87c56ca68d0e7"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.2.0/cabidl-0.2.0-linux-x86_64.tar.gz"
      sha256 "da2e78e4e71d6656d7ec1727101a2f385f0cbc826ed5a0b0d523753b85463319"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
