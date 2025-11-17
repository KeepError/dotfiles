# Dock apps
apps=(
    "/System/Applications/Apps.app"
    "/Applications/Zen.app"
    "/Applications/Spark Desktop.app"
    "/System/Applications/Notes.app"
    "/System/Applications/Reminders.app"
    "/System/Applications/Music.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Ghostty.app"
    "/Applications/OrbStack.app"
    "/Applications/Insomnia.app"
)
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array
for app in "${apps[@]}"; do
  defaults write com.apple.dock persistent-apps -array-add "<dict>
     <key>tile-data</key>
     <dict>
       <key>file-data</key>
       <dict>
         <key>_CFURLString</key>
         <string>$app</string>
         <key>_CFURLStringType</key>
         <integer>0</integer>
       </dict>
     </dict>
   </dict>"
done

# Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "ShowStatusBar" -bool "true"
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Mission control
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.spaces "spans-displays" -bool "true"

# Dock
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "tilesize" -int "46"

# Screenshots
defaults write com.apple.screencapture "show-thumbnail" -bool "true"


killall Finder || true
killall Dock || true
