cask "beamer-viewer" do
  version "0.0.6"
  sha256 "6f17f64875ee553d3551394df2d2d42a85516c3defe68e6eacce076293913df5"

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
