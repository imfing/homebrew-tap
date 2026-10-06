cask "diffs" do
  version "0.7.0"

  on_macos do
    on_arm do
      sha256 "818a735fec76fd66cabd6158fca8da08036d5be1d5688692fed06b6559e5f86d"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "57b3a1e58c2d9a2b129214b93e9a9995128f9b97411b410e229b27d5f0990614"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "a5a84c0f8d4fe5577e9eb6306b6cfd0456e01dd007bd65f6653b3124dd9393da"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "115beb0aa42114290a061b95424126602a4608c5d11eda297a0b4311e1b6a7db"
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
