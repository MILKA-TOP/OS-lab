#!/bin/bash
awk '{print $1}' /var/log/anaconda/syslog > info.log
