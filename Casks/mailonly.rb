cask "mailonly" do
  version "0.1.0"
  sha256 "4ab06cc6dbc68d368d7b41c249722b0e8391a85681212a957fa6978e5dc024b3"

  url "https://github.com/utahta/mailonly/releases/download/v#{version}/mailonly-#{version}-arm64-mac.zip"
  name "mailonly"
  desc "Several personal Gmail accounts in one window"
  homepage "https://github.com/utahta/mailonly"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "mailonly.app"

  # mailonly is not notarized, so macOS refuses to open the quarantined
  # download, claiming the app is damaged.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/mailonly.app"]
  end

  zap trash: [
    "~/Library/Application Support/mailonly",
    "~/Library/Preferences/com.utahta.mailonly.plist",
    "~/Library/Saved Application State/com.utahta.mailonly.savedState",
  ]
end
