cask "primage" do
  version "0.2.1"

  on_macos do
    on_arm do
      sha256 "7759033ee4168817d5c0f282b8c93e220b9129a667860de8d8865a653d849ad5"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-apple-darwin.tar.gz"
    end
    on_intel do
      sha256 "5b793dd79181761d2b9ffb5c3ff1d52399827ba7f91c6439b247a81ff2860443"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-x86_64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "720efe4ac149bf372f7cfb9fc625b85320b088891d5ebad7744da42fd932b7a0"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "988302b5e34834f0774fd126f3f9481c653c9092f299683eeeec1cdd318b330e"
      url "https://github.com/imfing/primage/releases/download/v#{version}/primage-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  name "primage"
  desc "A fast CLI for compressing and converting images"
  homepage "https://github.com/imfing/primage"

  binary "primage"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/primage"]
    end
  end
end
