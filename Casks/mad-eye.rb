cask "mad-eye" do
  version "0.1.1"
  sha256 "cc24f5638d736bd43a4ea6254fd4b150d65694a27f925d708b70e94a0d021075"

  url "https://github.com/kvnwolf/mad-eye/releases/download/v#{version}/mad-eye_#{version}_universal.dmg"
  name "mad-eye"
  desc "Menubar Eye tracking Claude subscription usage"
  homepage "https://github.com/kvnwolf/mad-eye"

  depends_on macos: :monterey

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

    mad-eye isn't code-signed yet, so macOS Gatekeeper quarantines it. Clear the
    flag once so it opens:

      xattr -dr com.apple.quarantine "/Applications/mad-eye.app"

    (Or open it via System Settings → Privacy & Security → "Open Anyway".)
  EOS
end
