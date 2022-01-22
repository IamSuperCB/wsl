if [ ! -d /mnt/wsl/workspace ]; then
    mkdir /mnt/wsl/workspace
    mount --bind /home/betancourtca/workspace /mnt/wsl/workspace/
fi
