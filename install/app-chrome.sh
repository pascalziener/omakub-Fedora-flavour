# https://docs.fedoraproject.org/en-US/workstation-working-group/third-party-repos/
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y google-chrome-stable

xdg-settings set default-web-browser google-chrome.desktop

