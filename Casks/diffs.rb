cask "diffs" do
  version "0.5.2"

  on_macos do
    on_arm do
      sha256 "e83a85238aa9d95a3b76d1db2f05071841c16aacd37b989af7a1f9cc71676ad6"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "7b0aaa08e172443b654dbd67b7a8b41416795994883df1586116718e0a469433"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "091280a24858e99f69c0378ee66abadf5dc7694b4a75ac8df56aa9ed9b05ff40"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "4e33a59cc4d78e8993ad7e987deee18a342b6112199d0d21a265a10c81d303a8"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  name "diffs"
  desc "A tiny CLI for fast, beautiful local-first diffs in the browser"
  homepage "https://github.com/imfing/diffs-cli"

  binary "diffs"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/diffs"]
    end
  end
end
