
install: uninstall /usr/local/bin/grav-util /etc/bash_completion.d/grav-util

uninstall:
	- sudo rm -rf /usr/local/lib/grav-util
	- sudo rm /usr/local/bin/grav-util

/usr/local/lib/grav-util:
	sudo cp -a ./ ${@}

/usr/local/bin/grav-util: /usr/local/lib/grav-util
	sudo ln -s /usr/local/lib/grav-util/grav-util ${@}

/etc/bash_completion.d/grav-util:
	sudo cp ./completions /etc/bash_completion.d/grav-util

