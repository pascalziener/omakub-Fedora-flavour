# Gum is used for the Omakub commands for tailoring Omakub after the initial install
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo

sudo dnf makecache
GUM_VERSION="0.14.1" # Use known good version
sudo dnf install -< gum-${GUM_VERSION}-1.x86_64

