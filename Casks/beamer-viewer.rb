cask "beamer-viewer" do
  version "0.0.5"
  sha256 "864594807b919eaeac0f8ba7e43f16762bf66a9148aef492c6f80896546385f0"

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
