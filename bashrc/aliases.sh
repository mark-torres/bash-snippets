# THIS ALIASES ARE MEANT TO BE ADDED TO PERSONAL
# .bashrc FILE


# Quick "cd" to specific directory, like your ~/Git folder if it exists
if [ -d "$HOME/Git" ] ; then
	alias gogit="cd $HOME/Git"
fi

# GENERIC UNIX
alias ls="ls -lhFg"
alias ping="ping -c 10 -i 2"
alias go2up="cd ../.."
alias go3up="cd ../../.."
alias go4up="cd ../../../.."
alias javafiles="find . -type f -name '*.java'"
alias swiftfiles="find . -type f -name '*.swift'"
alias dartfiles="find . -type f -name '*.dart'"
alias phpfiles="find . -type f -name '*.php'"
alias nmapssl="sudo nmap --script ssl-cert,ssl-enum-ciphers -p 443"
alias dateinfo="date +'%a %b %d %Y, %k:%Mhrs - Week:%U, Day:%j'"

# MAC OS
alias adb="~/Library/Android/sdk/platform-tools/adb"
alias xcode-DerivedData="cd ~/Library/Developer/Xcode/DerivedData"
alias libarch-info="lipo -info"
test -f ~/Library/Android/sdk/platform-tools/adb && alias adb="~/Library/Android/sdk/platform-tools/adb"
test -d ~/Library/Developer/CoreSimulator/Devices && alias cdsimdev="cd ~/Library/Developer/CoreSimulator/Devices/"

# iOS Simulator app
_SIMAPP=/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
alias simulator="test -d $_SIMAPP && open $_SIMAPP; test -d $_SIMAPP || echo Simulator not found"
