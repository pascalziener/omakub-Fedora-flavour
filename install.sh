# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo dnf upgrade -y
sudo dnf install -y curl git unzip

# Needed by some installers
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ~/.local/share/omakub/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo dnf upgrade -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
