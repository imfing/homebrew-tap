cask "diffs" do
  version "0.4.0"

  on_macos do
    on_arm do
      sha256 "c26f68fc9b127edd54e372fd5e66fa4eaa7f804ba18555fdbf8d84e003e8ec93"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-apple-darwin.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
    on_intel do
      sha256 "83bcee50577a6c6d5c65e5ba987f503b7c14eff7b11e07330c2d7d1004907e44"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-x86_64-apple-darwin.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
  end

  on_linux do
    on_arm do
      sha256 "c6eaa323308da2780da7c60f7c14dea981eeb61d58163321bab6fa1609bf698c"
      url "https://github.com/imfing/diffs-cli/releases/download/v#{version}/diffs-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/diffs-cli/"
    end
    on_intel do
      sha256 "2af5df1c86448a100a26091891621d5212e383c9ed68196f3ea6e9dcc6eb49a7"
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
