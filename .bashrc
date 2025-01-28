#.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias neofetch='/home/mielota/.config/neofetch/neofetch'
alias pipes='pipes.sh -t 0'
alias minecraft='nohup &> /dev/null ~/Desktop/minecraft-launcher &'
alias logisim='Java ~/Desktop/logisim.jar'
# Apparence du prompt
PS1='  \[\e[38;5;140m\]\w\[\e[0m\] > '

# Comportements par défaut de .bashrc
neofetch

# Reset le terminal et charger la config
load() {
	source ~/.bashrc
}

# Forcer les .jar à utiliser wayland
Java() {
	nohup &> /dev/null env _JAVA_AWT_WM_NONREPARENTING=1 java -jar $1 &
}

# Se déplacer dans un répertoire et afficher le contenu du répertoire
cdl() {
	cd $1 && ls
}	

# Enregistrer l'écran
record() {
	if [[ -f ./joyboy.mp4 ]] then {
		rm joyboy2k.mp4
	} fi
	wf-recorder -r 30 -f joyboy2k.mp4 -y
}

# Convertir l'enregistrement de 2K à 1080p
downscale() {
	ffmpeg -i joyboy2k.mp4 -vf "scale=1920:1080" -c:a copy joyboy1080p.mp4
}

# Obtenir l'adresse ip lorsque connecté avec la carte wifi
whatip() {
	ip a | grep wlp3s0 | grep inet | awk {'print $2'} | cut -d "/" -f 1
}

# Supprimer les fichiers grim et wf-recorder
screendel() {
	rm ~/$(date +%Y%m)*.png 2> /dev/null
	rm ~/joyboy2k.mp4 2> /dev/null
	rm ~/joyboy1080p.mp4 2> /dev/null
}

# Lancer sway après la connexion du pc
if [[ "$(tty)" == "/dev/tty1" ]] then
	dbus-launch sway
fi
. "$HOME/.cargo/env"
