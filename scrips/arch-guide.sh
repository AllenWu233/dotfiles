#!/bin/zsh
cd ~/repo/arch-guide
git pull
pnpm docs:dev & sleep 1 && firefox http://localhost:5173/
