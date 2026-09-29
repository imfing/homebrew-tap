cask "diffs" do
  version "0.6.0"

  on_macos do
    on_arm do
      sha256 "1d4dee8fe7cf7eccb534bbda8bf00ce8b0b65554669a5b506e51acbc46f8c721"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "565b9d2da77ce9b4ee831f95684b4cf1a1ebf4ce4fe2aa00c6625821c7441f2f"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "a2df799f087bf814b03c4c6f27e7e0654bbe4fe8bcf92a89b8f4f6c7e5a47e8c"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "b498ebdfd1f3106e066e18b28b2f4daead01800450bb7143b4dba8569e1f488f"
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
