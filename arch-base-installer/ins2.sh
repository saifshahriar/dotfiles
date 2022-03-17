mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3

mkswap /dev/sda2

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2
lsblk
sleep 10s
reflector -c Bangladesh >> /etc/pacman.d/mirrorlist
reflector -c India >> /etc/pacman.d/mirrorlist
vim /etc/pacman.d/mirrorlist
