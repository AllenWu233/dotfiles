#!/bin/bash
sudo btrfs subvolume snapshot -r / /.snapshots/@
sudo btrfs subvolume snapshot -r /home /.snapshots/@home
sudo btrfs send -p /.snapshots/@ | sudo btrfs receive /data/.snapshots
sudo btrfs send -p /.snapshots/@home | sudo btrfs receive /data/.snapshots
