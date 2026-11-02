cask "ouchimail" do
  version "0.3.0"
  sha256 "b93ad3f504406f4580d128636686917a9687794271201a7f6b10c0edd603e26c"

  url "https://github.com/utahta/ouchimail/releases/download/v#{version}/ouchimail-#{version}-arm64-mac.zip"
  name "ouchimail"
  desc "Several personal Gmail accounts in one window"
  homepage "https://github.com/utahta/ouchimail"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ouchimail.app"

  # ouchimail is not notarized, so macOS refuses to open the quarantined
  # download, claiming the app is damaged.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ouchimail.app"]
  end

  zap trash: [
    "~/Library/Application Support/ouchimail",
    "~/Library/Preferences/com.utahta.ouchimail.plist",
    "~/Library/Saved Application State/com.utahta.ouchimail.savedState",
  ]
end
