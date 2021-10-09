man bash | tr -s [:upper:] [:lower:] | grep --only-matching "[[:alpha:]]\{4,\}" | sort -d | uniq --count | sort -r -n -k1 | head -3 | awk '{print $2}'
