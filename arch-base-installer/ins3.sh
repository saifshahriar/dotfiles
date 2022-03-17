pacstrap /mnt base base-devel linux linux-firmware vi vim networkmanager git grub sudo
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
systemctl enable NetworkManager
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
vim /etc/hostname
