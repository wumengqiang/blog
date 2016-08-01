#!/bin/bash
pkill hexo -f
sudo hexo generate -d
pm2 restart start.sh
