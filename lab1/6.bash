#!/bin/bash
grep -e "(\*\*)" /var/log/anaconda/X.log | sed -e 's/(\*\*)/Wargning:/g' > full.log
grep -e "(II)" /var/log/anaconda/X.log | sed -e 's/(II)/Information:/g' >> full.log
cat full.log
