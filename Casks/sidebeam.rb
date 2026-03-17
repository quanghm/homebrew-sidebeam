cask "sidebeam" do
  version "0.3.1"
  sha256 "595c584de88b3c878bdb05eaf111e67fe55da2e4ceefe96dfffed17ef4296cc8"

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
