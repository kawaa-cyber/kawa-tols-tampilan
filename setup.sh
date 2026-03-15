#!/bin/bash
# KAWA CYBER TERMINAL - Setup Script
# Author: Kawa Cyber Team

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

clear
echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║    ██╗  ██╗ █████╗ ██╗    ██╗ █████╗     ${GREEN}KAWA CYBER${CYAN}              ║"
echo "║    ██║ ██╔╝██╔══██╗██║    ██║██╔══██╗    ${GREEN}TERMINAL${CYAN}                 ║"
echo "║    █████╔╝ ███████║██║ █╗ ██║███████║    ${YELLOW}SETUP SCRIPT${CYAN}              ║"
echo "║    ██╔═██╗ ██╔══██║██║███╗██║██╔══██║                            ║"
echo "║    ██║  ██╗██║  ██║╚███╔███╔╝██║  ██║    ${BLUE}v3.0${CYAN}                       ║"
echo "║    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝                            ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}[•] Starting installation...${NC}"
sleep 2

# Update termux
echo -e "\n${BLUE}[1/6] Updating Termux...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "\n${BLUE}[2/6] Installing dependencies...${NC}"
pkg install -y python python2 git nano wget curl \
    nmap hydra sqlmap metasploit \
    wireshark aircrack-ng john hashcat

# Install python packages
echo -e "\n${BLUE}[3/6] Installing Python packages...${NC}"
pip install requests colorama tqdm psutil pyfiglet termcolor rich cryptography

# Create directories
echo -e "\n${BLUE}[4/6] Creating directories...${NC}"
mkdir -p ~/kawa-terminal/{themes,modules,tools}
mkdir -p /sdcard/kawa-tools

# Download scripts
echo -e "\n${BLUE}[5/6] Downloading scripts...${NC}"
cd ~/kawa-terminal
wget -q https://raw.githubusercontent.com/kawacyber/kawa-terminal/main/kawa_cyber.py
wget -q https://raw.githubusercontent.com/kawacyber/kawa-terminal/main/install.py
wget -q https://raw.githubusercontent.com/kawacyber/kawa-terminal/main/requirements.txt

# Set permissions
echo -e "\n${BLUE}[6/6] Setting permissions...${NC}"
chmod +x kawa_cyber.py install.py

# Storage permission
echo -e "\n${YELLOW}[!] Requesting storage permission...${NC}"
termux-setup-storage

# Final message
echo -e "\n${GREEN}╔═══════════════════════════════════════════════════════════════════╗"
echo "║                    INSTALLATION COMPLETE!                          ║"
echo "╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo -e "\n${CYAN}To start KAWA CYBER TERMINAL:${NC}"
echo -e "  ${GREEN}cd ~/kawa-terminal${NC}"
echo -e "  ${GREEN}python kawa_cyber.py${NC}"
echo -e "\n${YELLOW}Note: Restart Termux for best experience${NC}\n"
