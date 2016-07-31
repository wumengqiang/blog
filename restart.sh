#!/bin/bash
pkill hexo -f
git pull origin master
sudo hexo generate -d
sudo forever start server.js
