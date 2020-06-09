# TeamViewver


sudo pacman -Sy

sudo pacman -S git

git clone https://aur.archlinux.org/teamviewer.git

cd teamviewer/

makepkg -s

sudo pacman -Sy

sudo pacman -U teamviewer*.pkg.tar.xz


sudo systemctl status teamviewerd

sudo systemctl start teamviewerd

sudo systemctl enable teamviewerd


# bash-autocomplete

sudo pacman -S bash-completion
