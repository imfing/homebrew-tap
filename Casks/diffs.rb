cask "diffs" do
  version "0.5.1"

  on_macos do
    on_arm do
      sha256 "a95dc54d98060ff4b6f2a499a7d3dc7d5664a7700f5451df4e707382bf2c13be"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "008b3e8329866b28c41b38a17d83967d9f369aa2bd0ff6eef32a8498cac005c1"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "32ca097d99654e1467e6e117fbb485d09d388c9782f8b63b81fbf7558f55bec3"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "ba87e20cf090724d42dec4b33cae643fe758eb06929d5de58a52542988bc3d57"
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
