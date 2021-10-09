#!/bin/bash
awk '"INFO"==$2' /var/log/anaconda/syslog > info.log
