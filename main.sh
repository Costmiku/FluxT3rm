#!/bin/env bash

FXTM_VER=3.0-"preview"

main() {
tunnel
}

tunnel() {
echo "
 _____ _            _____ _____                
|  ___| |_   ___  _|_   _|___ / _ __ _ __ ___  
| |_  | | | | \ \/ / | |   |_ \| '__| '_ ˇ _ \ 
|  _| | | |_| |>  <  | |  ___) | |  | | | | | |
|_|   |_|\__,_/_/\_\ |_| |____/|_|  |_| |_| |_|
Preview

"

fxtm_main
}

fxtm_main() {
read -p "$PWD FxTm3> " FXTM_PROMPT
case "$FXTM_PROMPT" in
	"multiScriptEditor")
		echo -e "#!/bin/bash\n# This file is important if you want to run multiple commands at once in FluxT3rm.\n# This file gets wiped every time you edit it. To keep the contents of the file,\n# run 'multiScriptEditor --Keep' instead to edit the file while keeping the content aswell. To run the script, type 'multiScriptRun'." > ~/zhcpt.sh
		nano ~/zhcpt.sh
		chmod +x ~/zhcpt.sh
	;;
	"multiScriptEditor --Keep")
		nano ~/zhcpt.sh
		chmod +x ~/zhcpt.sh
	;;
	"multiScriptRun")
		chmod +x ~/zhcpt.sh
		sh ~/zhcpt.sh
	;;
	"help")
		echo "
help - Displays this info and all commands
multiScriptEditor - Erases and opens the multiscript file with the nano text editor
-> Options
   -> --Keep - Opens the multiscript file without erasing in the nano text editor
multiScriptRun - Runs the multiscript file
about/getAbout - displays FluxT3rm info
shellMode - Lets you run commands in sh/bash
getChildItems - list contents of the directory
exit - Exit FluxT3rm
"
	;;
	"testCommand")
		listChildItems
	;;
	"about"|"getAbout")
		getAbout
	;;
	"shellMode")
		shellMode() {
			read -p "$PWD shellMode> " FXTM_PROMPT
			case "$FXTM_PROMPT" in
				exit)
					echo "OK"
				;;
				*)
					$FXTM_PROMPT
					shellMode
				;;
			esac
		}
		shellMode
	;;
	"getChildItems")
		ls
	;;
	"exit")
		exit
	;;
	*)
		echo "Command $FXTM_PROMPT does not exist. Run the 'help' command for a list of commands, or try running the command inside shellMode." && fxtm_main
	;;
esac
fxtm_main
}

getAbout() {
echo "
 _____ _            _____ _____                
|  ___| |_   ___  _|_   _|___ / _ __ _ __ ___  
| |_  | | | | \ \/ / | |   |_ \| '__| '_ ˇ _ \ 
|  _| | | |_| |>  <  | |  ___) | |  | | | | | |
|_|   |_|\__,_/_/\_\ |_| |____/|_|  |_| |_| |_|
Copyright (c) 2023 Costmiku

    Version: $FXTM_VER
         OS: $(uname)
        PWD: $PWD
    Authors: The Costmiku Team, kevadesu
    License: MIT
Bug reports: "https://forums.costmiku.org" "https://groups.google.com/g/costmiku-bugs"
"
}
main
