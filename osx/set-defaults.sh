# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

##
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
##

# Magic Mouse: enable 2 
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "TwoButton"

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

##
# Better Touch Tool
##
defaults write launchOnStartup -bool true

##
# iChat
##

# make it more silent on some events
osascript "$DOT/osx/iChat-prefs.scpt"

##
# Terminal
##

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Pro theme by default in Terminal.app
open "$DOT/osx/Bond.terminal"
sleep 1 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "Bond"
defaults write com.apple.terminal "Startup Window Settings" -string "Bond"

# Enable "focus follows mouse" for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true



##
# Kill affected applications
##

for app in "BetterTouchTool"; do
    killall "$app" > /dev/null 2>&1
done

##
# Open background affected applications
##
for app in "BetterTouchTool"; do
    if [[ -a /Applications/"$app".app ]]
    then
        open /Applications/"$app".app
	fi
done

echo "Done. Note that some of these changes require a logout/restart to take effect."

# Terminal goes at the end
killall Terminal > /dev/null 2>&1