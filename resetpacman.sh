#!/bin/bash
sudo rm -rf /var/cache/pacman/pkg/*
sudo cachyos-rate-mirrors
sudo pacman -Syyu
