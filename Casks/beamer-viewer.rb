cask "beamer-viewer" do
  version "0.0.6"
  sha256 "82cf0cf52846347167ce334e33482fc0cb868ee2dec063d3776b3f17d55231cf"

  url "https://github.com/quanghm/beamer-viewer/releases/download/v#{version}/BeamerViewer-#{version}-macos.zip"
  name "Beamer Viewer"
  desc "Native macOS PDF presenter console for Beamer slides"
  homepage "https://github.com/quanghm/beamer-viewer"

  depends_on macos: ">= :sonoma"

  app "BeamerViewer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/BeamerViewer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.quanghm.beamer-viewer",
    "~/Library/Preferences/com.quanghm.beamer-viewer.plist",
  ]
end
