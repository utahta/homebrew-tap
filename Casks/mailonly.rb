cask "mailonly" do
  version "0.2.0"
  sha256 "87e56c29e88b7916c729f17fae1e5d63a873a4e69ffb8435d6a2d3846eb22b58"

  url "https://github.com/utahta/mailonly/releases/download/v#{version}/mailonly-#{version}-arm64-mac.zip"
  name "mailonly"
  desc "Several personal Gmail accounts in one window"
  homepage "https://github.com/utahta/mailonly"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "mailonly.app"

  # mailonly is not notarized, so macOS refuses to open the quarantined
  # download, claiming the app is damaged.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/mailonly.app"]
  end

  zap trash: [
    "~/Library/Application Support/mailonly",
    "~/Library/Preferences/com.utahta.mailonly.plist",
    "~/Library/Saved Application State/com.utahta.mailonly.savedState",
  ]
end
