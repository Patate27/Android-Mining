#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
mkdir ~/.ssh; chmod 0700 ~/.ssh
cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxJltddejYenO0+JqjBGdjAF1EilFtc192SLC8KR7WgryHMv9cO5lLwZ4u8hnCx4eCMO7X2cIXcWg2aGeuwdq/vz9jIwTjv46wBa0+pmM8pX93wsT8DrWN6anCXvp5wPRGjXkz6m+Ftn0MMTaTBqDgLJxYNuXhB+FR/6G16BYWATVp1DOqB9Q1Rs2JpVhWabPET4icdEJ7lr3mkW44qafgXv20j5syAuBtPdtRds6f/GBFODxJghh/YfxiOTyGEvi8C7zxtLkMGBKcVWSxUDU299DkTYKul02ogB0YC9PBUpCA522PxMiAoP/XhZnBwfah/kG6kjgwqK+G7QY+fD+IYZIQTBLDfKNG57SHjVq8ujz30e+AMJZc8pdydjc0FUo0+KYXmF/nW2XyDYKU0e55gI8XB/5oWDq3drr090Xm6OFf6MrHX38vhmNddTc402GhPg+FMwKugCgG7a5AYTqtOOoEXjTK+E78ydFIaIFbk2zjE/WhjUQrOT78dCjvxd8= no-li@DESKTOP-UMR07MJ
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer
cd ~/ccminer
wget https://github.com/Oink70/Android-Mining/releases/download/v0.0.0-2/ccminer
wget https://raw.githubusercontent.com/Patate27/Android-Mining/main/config.json
chmod +x ccminer
cat << EOF > ~/ccminer/start.sh
#!/bin/sh
#exit existing screens with the name CCminer
screen -S CCminer -X quit
#wipe any existing (dead) screens)
screen -wipe
#create new disconnected session CCminer
screen -dmS CCminer
#run the miner
screen -S CCminer -X stuff "~/ccminer/ccminer -c ~/ccminer/config.json\n"
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
