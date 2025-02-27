#!/bin/bash

# Security Hardening Script for Ubuntu-based Containers
set -e

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Exiting."
    exit 1
fi

# Update and upgrade system packages
apt-get update -y && apt-get upgrade -y

# Install security tools
apt-get install -y ufw fail2ban unattended-upgrades auditd

# Restrict root access
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
service ssh restart

# Create a non-root user for operations
if ! id "secureuser" &>/dev/null; then
    useradd -m -s /bin/bash secureuser
    echo "secureuser:securepassword" | chpasswd
    usermod -aG sudo secureuser
fi

# Harden sysctl settings
cat <<EOT >> /etc/sysctl.conf
# Prevent SYN flood attacks
net.ipv4.tcp_syncookies = 1
# Enable IP spoofing protection
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
# Disable ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
EOT
sysctl -p

# Set file permissions
chmod 700 /root
chmod 600 /etc/ssh/sshd_config

# Enable firewall with minimal rules
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw --force enable

# Enable automatic security updates
cat <<EOT > /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOT

# Restart services to apply changes
systemctl restart auditd
systemctl restart fail2ban

echo "Security hardening applied successfully."
