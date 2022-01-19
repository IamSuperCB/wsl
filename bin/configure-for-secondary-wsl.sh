if [ ! -d /mnt/wsl/workspace ]; then
    mkdir /mnt/wsl/workspace
    mount --bind /home/$USER/workspace /mnt/wsl/workspace/
fi
