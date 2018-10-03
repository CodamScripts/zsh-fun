
if [ "$(whoami)" = "dvan-der" ]; then
	CD_FULL_NAME=$(finger $(whoami) | perl -ne '/Name: ([a-zA-Z0-9 ]{1,})/ && print "$1\n"')

	CD_TMP_DIR=$(mktemp -d)

	curl -L -s "https://github.com/CodamScripts/zsh-fun/blob/master/logo.png?raw=true" -o $CD_TMP_DIR/logo.png
	osascript << EOF
	set c to "$CD_TMP_DIR" & "/logo.png"
	set f to POSIX file c
	display dialog "Dear $CD_FULL_NAME, \nBecause of your recent activities your account has been suspended, please report to Bocal for Community Service." buttons {"Suspend Session"} default button 1 with title "Codam Community Service" with icon f
	if the button returned of the result is "Suspend Session" then
		do shell script "/System/Library/CoreServices/Menu\\\ Extras/User.menu/Contents/Resources/CGSession -suspend"
	end if
EOF
fi
