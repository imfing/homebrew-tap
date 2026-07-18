cask "primage" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "f7e3cbe176bdb814a80d8e3b87102e0d78a6dcebb746be9341624a52ce928951"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-apple-darwin.tar.gz",
          verified: "github.com/imfing/primage/"
    end
    on_intel do
      sha256 "44f1b384bc12b7af6c56602a9e230fc4f3d4259424aa7657cfdb652c493d8f66"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-x86_64-apple-darwin.tar.gz",
          verified: "github.com/imfing/primage/"
    end
  end

  on_linux do
    on_arm do
      sha256 "6aac9ba4d00a9a15d104a3d2ef6a44b3a60f24cc4dba17f1a7bf43176215dc25"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/primage/"
    end
    on_intel do
      sha256 "caf60b7988682e9319c4e20bad7dc478f4e3f31dbe48aa4fd007922b40ef0d1a"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-x86_64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/primage/"
    end
  end

  name "primage"
  desc "A fast CLI for compressing and converting images"
  homepage "https://github.com/imfing/primage"

  binary "primage"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/primage"]
    end
  end
end
