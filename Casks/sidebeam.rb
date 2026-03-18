cask "sidebeam" do
  version "0.4.0"
  sha256 "4a647e449d9b022d4384e3b9e3045bb851096f56945f59f14de64067d8a40afb"

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
