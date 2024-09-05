#!/bin/bash
DATE=$(date -d @$(date +%s) "+_%Y-%m-%d")
if [ -d "/.snapshots/old_root_snapshot" ]; then
    echo "Old snapshots exist, sending incremental stream..."
    sudo btrfs subvolume snapshot -r / /.snapshots/root_snapshot
    sudo btrfs subvolume snapshot -r /home /.snapshots/home_snapshot
    sudo btrfs send -p /.snapshots/old_root_snapshot /.snapshots/root_snapshot$"DATE" | sudo btrfs receive /data/.snapshots
    sudo btrfs send -p /.snapshots/old_home_snapshot /.snapshots/home_snapshot$"DATE" | sudo btrfs receive /data/.snapshots
    echo "Deleting old snapshots..."
    sudo btrfs subvolume delete /.snapshots/old_root_snapshot
    sudo btrfs subvolume delete /.snapshots/old_home_snapshot
else
    echo "Old snapshots not exist, creating and sending new snapshots..."
    sudo btrfs subvolume snapshot -r / /.snapshots/root_snapshot
    sudo btrfs subvolume snapshot -r /home /.snapshots/home_snapshot
    sudo btrfs send /.snapshots/root_snapshot | sudo btrfs receive /data/.snapshots
    sudo btrfs send /.snapshots/home_snapshot | sudo btrfs receive /data/.snapshots
fi
echo "Renaming new snapshots to old_*_snapshot..."
sudo mv /.snapshots/root_snapshot /.snapshots/old_root_snapshot
sudo mv /.snapshots/home_snapshot/.snapshots/old_home_snapshot

if [ $? -eq 0 ]; then
    echo "Done!"
else
    echo "Failed!"
fi
