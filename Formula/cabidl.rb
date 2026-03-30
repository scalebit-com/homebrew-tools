class Cabidl < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.7.0/cabidl-0.7.0-macos-arm64.tar.gz"
      sha256 "25f38481cb69fe723057520f5a036531b0a1bc3115f12e2117e8c5317b5f0ed4"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.7.0/cabidl-0.7.0-macos-x86_64.tar.gz"
      sha256 "7ceba4e3b50a1441372e03ae82202eeb84a815756d8a19748b25bb8f7218669c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.7.0/cabidl-0.7.0-linux-arm64.tar.gz"
      sha256 "7cca7d09acf9d575b040e21e25debf3abd415525d38f30c18b54a43e1044067d"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/v0.7.0/cabidl-0.7.0-linux-x86_64.tar.gz"
      sha256 "34946265ca984317611d1e4420c8d5d80ae3499f84b83b41b1354ae56a25d83d"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
