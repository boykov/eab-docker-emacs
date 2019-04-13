#!/bin/bash

# Start supervisord and services
sudo /usr/bin/supervisord -n -c /etc/supervisord.conf &
sleep infinity
