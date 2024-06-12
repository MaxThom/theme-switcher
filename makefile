build:
	amber theme-switcher.ab theme-switcher.sh
	sed -i '1i #!/bin/bash' theme-switcher.sh
	
install: build
	sudo cp theme-switcher.sh /usr/local/bin/tsw
