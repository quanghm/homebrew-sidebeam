cask "sidebeam" do
  version "0.1.1"
  sha256 "7fec407f68bbef0e20b5441eb989ca6d6ae4cadb29a54b97fb1a3978d90a7b86"

  url "https://github.com/quanghm/sidebeam/releases/download/v#{version}/SideBeam-#{version}-macos.zip"
  name "SideBeam"
  desc "Native macOS/iOS PDF presenter console"
  homepage "https://github.com/quanghm/sidebeam"

  depends_on macos: ">= :sonoma"

  app "SideBeam.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SideBeam.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.quanghm.sidebeam",
    "~/Library/Preferences/com.quanghm.sidebeam.plist",
  ]
end
