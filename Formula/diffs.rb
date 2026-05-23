# typed: false
# frozen_string_literal: true

class Diffs < Formula
  desc "Fast, beautiful diffs on the Go"
  homepage "https://github.com/imfing/diffs-cli"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imfing/diffs-cli/releases/download/v0.1.1/diffs_0.1.1_darwin_amd64.tar.gz"
      sha256 "c118f9f52a3ddce0e3622fb2a1f8141b42e431cb563031ddc89a34613c6397ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/imfing/diffs-cli/releases/download/v0.1.1/diffs_0.1.1_darwin_arm64.tar.gz"
      sha256 "f5c0a53b2355aaa9f04c79fd51630e3eef0492b8d894f00b0c15ac5d40f66fee"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/imfing/diffs-cli/releases/download/v0.1.1/diffs_0.1.1_linux_arm64.tar.gz"
      sha256 "0d4df14b0cd755e090774e6313e0d845ea7a006072fe6feb624126c3dcfd3fee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/imfing/diffs-cli/releases/download/v0.1.1/diffs_0.1.1_linux_amd64.tar.gz"
      sha256 "1fd45b9cd0275f3c77c9c32be30d58cd73668637be3dc687c1b67a8ecd7483ae"
    end
  end

  def install
    bin.install "diffs"
  end

  test do
    assert_match "Review local diffs", shell_output("#{bin}/diffs --help")
  end
end
