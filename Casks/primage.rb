cask "primage" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "57629ba0d3bc1ef30a1d1641e146065ae54c4ccee9a22ad41bbe1fb4e5c40b82"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-apple-darwin.tar.gz",
          verified: "github.com/imfing/primage/"
    end
    on_intel do
      sha256 "2da9779fca0aed44708629112bd9937d001dd149e2dda94a8e38a8625aa9b5ba"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-x86_64-apple-darwin.tar.gz",
          verified: "github.com/imfing/primage/"
    end
  end

  on_linux do
    on_arm do
      sha256 "e57753746b044733dd5a7a8af1a32f082eb37c3571d0ebe7c8a3b7e8689f95f8"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-unknown-linux-gnu.tar.gz",
          verified: "github.com/imfing/primage/"
    end
    on_intel do
      sha256 "c65dc2bdd7c5fb5cac3cbb85c21c2c50ec992cb280881682f1ab9f80b6242179"
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
