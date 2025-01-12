# Note : These packages are installed under void linux (xbps-query package manager)

sudo xbps-install -Sy void-repo-nonfree void-repo-multilib
sudo xbps-install -Syu
sudo xbps-install -Sy rofi Waybar firefox pulseaudio NetworkManager grim slurp htop btop fastfetch lf foot swayfx wlroots wayland xorg-server-xwayland vim zip unzip python3 polkit pavucontrol openssh openssl openjdk21 elogind dbus-elogind polkit-elogind alsa-utils qt6-wayland cava mplayer

sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/polkitd /var/service

sudo xbps-remove -Ooy
