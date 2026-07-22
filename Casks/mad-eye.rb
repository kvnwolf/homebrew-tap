cask "mad-eye" do
  version "0.1.0"
  sha256 "1f6f47fc449ba2c39e5169632697ea595edeb78f6552c42cc11b6afa938eb5a7"

  url "https://github.com/kvnwolf/mad-eye/releases/download/v#{version}/mad-eye_#{version}_universal.dmg"
  name "mad-eye"
  desc "Menubar Eye tracking Claude subscription usage"
  homepage "https://github.com/kvnwolf/mad-eye"

  depends_on macos: ">= :monterey"

  app "mad-eye.app"

  zap trash: [
    "~/Library/Application Support/com.kvnwolf.mad-eye",
    "~/Library/LaunchAgents/com.kvnwolf.mad-eye.plist",
    "~/Library/Saved Application State/com.kvnwolf.mad-eye.savedState",
  ]

  caveats <<~EOS
    mad-eye reads Claude Code's OAuth credentials from your Keychain, so it needs
    Claude Code installed and logged in. On first launch macOS asks to read the
    "Claude Code-credentials" item — click "Always Allow".
  EOS
end
