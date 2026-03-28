class CabidlAT04 < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.4.0/cabidl-0.4.0-macos-arm64.tar.gz"
      sha256 "ddd61766ebb5cc17dfedf8ed6147afde66d8bbe0047dced2e3643762de253f45"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.4.0/cabidl-0.4.0-macos-x86_64.tar.gz"
      sha256 "0b08996aa95495ff3544a57fdcbe5a7135fb6568162a8cde8f326b59b9bdd3ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.4.0/cabidl-0.4.0-linux-arm64.tar.gz"
      sha256 "64ea9a687727dd60c4b54a62fe50b4383f2b5f2e86617acc57d4a4cc6fd01dab"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.4.0/cabidl-0.4.0-linux-x86_64.tar.gz"
      sha256 "3c104c97b356cdc194379b6a7753a7158b7f2ae43b3c29c36f673d0b8d2212f7"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
