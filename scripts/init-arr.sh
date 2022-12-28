#!/bin/bash

sudo rm -rf /data/*
sudo mount -t nfs 192.168.1.83:/volume1/data /data

cd /home/suser/code/home
docker-compose restart
