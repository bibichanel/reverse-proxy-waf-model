#!/bin/bash

#detele old process 
sudo rm -f /nginxProxy/tmp/pids/server.pid

#Excute pass through command
exec "$@"
