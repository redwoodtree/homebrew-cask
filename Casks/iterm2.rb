cask "iterm2" do
  # note: "2" is not a version number, but an intrinsic part of the product name
  if MacOS.version <= :high_sierra
    version "3.3.12"
    sha256 "6811b520699e8331b5d80b5da1e370e0ed467e68bc56906f08ecfa986e318167"
  else
    version "3.4.0"
    sha256 "5f78331d4786ead6fff49c86738be8fab3a1777346c3e35e6bb9c6cad52c1a47"
  end

  url "https://iterm2.com/downloads/stable/iTerm2-#{version.dots_to_underscores}.zip"
  appcast "https://iterm2.com/appcasts/final_modern.xml"
  name "iTerm2"
  desc "Terminal emulator as alternative to Apple's Terminal app"
  homepage "https://www.iterm2.com/"

  auto_updates true
  conflicts_with cask: "iterm2-beta"
  depends_on macos: ">= :sierra"

  app "iTerm.app"

  zap trash: [
    "~/Library/Application Support/iTerm",
    "~/Library/Application Support/iTerm2",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.googlecode.iterm2.sfl*",
    "~/Library/Caches/com.googlecode.iterm2",
    "~/Library/Preferences/com.googlecode.iterm2.plist",
    "~/Library/Saved Application State/com.googlecode.iterm2.savedState",
  ]
end
