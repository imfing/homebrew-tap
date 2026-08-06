cask "diffs" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 "778826f4aedf0fb4c2f535fa9a0ba83f0ef881cfb1b09dbc20004fda3782c4d0"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
    on_intel do
      sha256 "2c451a8283f1d75bc08beb0e512a3de3310fb3aa42d4d0db52777972e2e1b6fb"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
  end

  on_linux do
    on_arm do
      sha256 "39852c036b907d7f7f55fb3987399bc9b61b6529c988298c2923c7fbf473dd91"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
    on_intel do
      sha256 "cf017a73f15e66f1796cca03ce7ee892ee0e76665cb9a24fd5a7b9a1f50edbda"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
  end

  name "diffs"
  desc "A tiny CLI for fast, beautiful local-first diffs in the browser"
  homepage "https://github.com/imfing/diffs-cli"

  binary "diffs"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/diffs"]
    end
  end
end
