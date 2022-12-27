#!/bin/bash
# This script will quickly install software that I personally like to use on Debian-based Linux machines.
# It is not meant to be pretty or provide a lot of user feedback, but rather just gets the job done.
# It's still work-in-progress, and I'll comment out or uncomment software as I need it. If you see any use in this, feel free to take it as a starting block and tailor it to your needs.

# PPAs
	# Define PPAs
	ppas=(
		"ppa:phoerious/keepassxc" # Password manager
		# "ppa:flexiondotorg/audio" # mp3Gain, normalises mp3 file volume in bulk
		"ppa:libretro/stable" # Retroarch; emulator for a multitude of console ROMs
		"ppa:nextcloud-devs/client" # Nextcloud desktop client and nemo integration
		# "ppa:openshot.developers" # Video editing
		"ppa:solaar-unifying/stable" # Pairing tool for Logitech Unifying receivers
		"ppa:daniruiz/flat-remix" # Flat-remix icon theme
	)
	# Adds PPAs. Installation will be handled by the variable $reposoftware. Any package added through a ppa must also be noted down there
	function addppas() {
		for ppa in "${ppas[@]}" ; do
			sudo apt-add-repository "$ppa" # TODO: Deprecated because it uses apt-key. Must be replaced by the newer method.
			printf "\n"
		done
		sudo apt update
	}
	# Finalise; comment out to skip the whole step
	addppas

# REPO PACKAGES
# This must include packages from newly-added PPAs
	# Define packages
	reposoftware=(
		# Media playback and editing software
			gimp # Image editing
			vlc # Media playback
			gpicview # Image viewer
			#audacity # Audio recording and editing
			#kdenlive # video editing
			obs-studio # Screencasting and streaming
			easytag # mp3 tagging
			# darktable # RAW image converter
			nemo-media-columns # EXIF attributes in Nemo
			#gnome-raw-thumbnailer # Creates and displays thumbnails for RAW image files, e.g. Canon's .CR2 format
			#qjackctl # Configuration tool for JACK audio server
			#jack-rack # JACK tool for LSPDA audio effects
			#handbrake # DVD ripping and video conversion
		# Office and productivity software
			okular # PDF viewer
			pdfsam # PDF editor
			#k3b # Burns and rips DVDs
			#libk3b7-extracodecs # mp3 codec for k3b
			freeplane # Mindmapping software
			gscan2pdf # Scanning utility
			tesseract-ocr # OCR for English
			tesseract-ocr-deu # OCR for German
		# System utilities
			#arandr # Screen layout manager
			powertop # Battery optimisation for notebooks; do NOT use on desktop PCs
			cpufrequtils # CPU throttling
			htop # Commandline process explorer
			samba # Network share utility
			nemo-terminal # Embedded terminal for Nemo
			wakeonlan # Sends magic packages to wake devices on LAN
			#terminator # Alternative Bash shell
			solaar # Manages Logitech Unifying receivers 
		# Coding and web development
			#geany # Text editor for coding
			markdown # Plain text markup language
			#qttools5-dev-tools 
			python3-pyqt5 # PyQt5
		# Security and privacy
			keepassxc # password manager
		# Misc
			gnome-tasks # Notes and checklists
			mint-backgrounds-tricia # Desktop backgrounds from Mint 19.3
			#xbindkeys # Remapping of keyboard / mouse input
			#wish # Needed by xbindkeys
			#xautomation # Keyboard / mouse input emulator; needed for remapping of keys and functions
			# virtualbox # VMs
		# Cloud services
			nextcloud-client # Nextcloud
			nextcloud-client-nemo # Nextcloud in Nemo
			syncthing # Cloudless ad-hoc syncing between devices
		# Gaming and gaming-related
			# wine-installer # Windows software compatibility layer
			#wine-stable
			#winetricks
			#playonlinux
			#haguichi #VPN LAN for gaming
			retroarch  # Console ROM emulator
	)
	# Finalise; comment out to skip the whole step
	sudo apt install "${reposoftware[@]}"
	
# REMOVE
# This will remove some unneeded default packages in Linux Mint.
	# Define packages to be removed
	remove=(
		xviewer
		xed
		xreader
		# hypnotix
		pix
	)
	function remove() {
		sudo apt remove "${remove[@]}"
	}
	#Finalise
	remove

# URLs for manual download of .deb packages
	# Define URLs
	softwareurls=(
		https://www.freefilesync.org/download.php # File synchronisation
		#https://www.apachefriends.org/ # Runs local apache server
		https://www.veracrypt.fr/ # Container / full disk encryption
		# http://www.opera.com/de/download  # Browser
		#https://anydesk.com/ # Remote desktop tool
		https://code-industry.net/get-masterpdfeditor/ # PDF editing
		#https://www.fotoparadies.de/bestellsoftware/download.html # Photo book tool
		#https://mediathekview.de/download/ # Play and download public German television broadcasts
		https://openaudible.org/ # Converts Audible's .aax to .mp3
		#https://freetubeapp.io/#download # Free Youtube wrapper
		#https://www.google.com/chrome/ # Google's cancerous browser
		#https://www.torproject.org/download/ # Tor Browser
	)
	function openurls() {
		# Open each URL in a new tab
		for url in ${softwareurls[@]}; do
			firefox --new-tab "$url"
		done
	}
	# Finalise; comment out to skip the whole step
	openurls
	
# Github
	# Define URLs
	githuburls=(
		https://github.com/SwallowYourDreams/ANGRYsearch/archive/master.zip
		https://github.com/SwallowYourDreams/cpu-control/archive/master.zip
		https://github.com/rizmut/libreoffice-style-breeze/archive/master.zip
	)
	function github() {
		#cd ~/tmp
		#mkdir "github-downloads"
		for url in ${githuburls[@]}; do
			firefox --new-tab "$url"
			# TO DO: automatic download / cloning. Needs more work.
			#wget "$url"
			#nemo $((pwd))
		done
	}
	# Finalise; comment out to skip the whole step
	github

# URLs to Firefox addons
	# Define URLs
	firefoxaddons=(
		#https://addons.mozilla.org/de/firefox/addon/adblocker-ultimate/ 
		#https://addons.mozilla.org/de/firefox/addon/noscript/
		#https://addons.mozilla.org/de/firefox/addon/self-destructing-cookies-1
		#https://addons.mozilla.org/de/firefox/addon/dark-background-light-text/ 
		#https://addons.mozilla.org/de/firefox/addon/image-block/ 
		#https://addons.mozilla.org/de/firefox/addon/foxyproxy-standard/
	)
	function firefoxaddons(){
		for url in ${firefoxaddons[@]}; do
			firefox --new-tab "$url"
			# TO DO: Automatic install. Needs more work.
			#wget "$url"
			#nemo ~/Downloads
		done
	}
	# Finalise; comment out to skip the whole step
	firefoxaddons

# Signal desktop app
	function installsignal() {
		curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
		echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
		sudo apt update && sudo apt install signal-desktop
	}
	# Finalise; comment out to skip the whole step
	installsignal

# Geany colour sceme
	function downloadgeanycolourscheme() {
		wget https://raw.github.com/geany/geany-themes/master/colorschemes/vibrant-ink.conf -P ~/.config/geany/colorschemes/ # geany vibrant colour scheme
	}
	# Finalise; comment out to skip the whole step
	downloadgeanycolourscheme
