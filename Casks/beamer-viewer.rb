cask "beamer-viewer" do
  version "0.1.1"
  sha256 "7fec407f68bbef0e20b5441eb989ca6d6ae4cadb29a54b97fb1a3978d90a7b86"

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
