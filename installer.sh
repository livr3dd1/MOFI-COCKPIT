#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

REAL_USER=${SUDO_USER:-$(whoami)}
USER_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)


echo -e "${CYAN} Starting Installation.${NC}"
sleep 3
echo ""
echo -e "${YELLOW} Making Dependencies...${NC}"
pip install requests customtkinter psutil --root-user-action=ignore --break-system-package --quiet >> log.log
sleep 2
echo""
echo -e "${GREEN} Creating Structure...${NC}"
sleep 1
sudo cp mofi.py /opt
sudo cp launcher.sh /usr/bin/mofi
sudo mkdir -p "$USER_HOME/.multilibs"
cp lib/ok.py "$USER_HOME/.multilibs/listprocs.py"
sleep 2
sudo chmod +x /opt/mofi.py
sudo chmod +x /usr/bin/mofi
sudo chown -R $REAL_USER:$REAL_USER "$USER_HOME/.multilibs"
sleep 2
echo""
echo -e "${GREEN} Finished!, Run with 'mofi' ${NC}"
exit
