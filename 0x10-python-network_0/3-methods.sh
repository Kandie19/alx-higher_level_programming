#!/bin/bash

if [ -z "$1" ]; then
 echo "Usage: $0 <URL>"
 exit 1
fi

url="$1"
methods=$(curl -X OPTIONS --head --silent --show-error --connect-timeout 1 --max-time 10 --retry 3 --retry-delay 1 --retry-max-time 40 --retry-connrefused $url -I 2>/dev/null | grep -i "^Allow:" | awk '{print $2}')

if [ -z "$methods" ]; then
 echo "No HTTP methods allowed."
else
 echo "Allowed HTTP methods:"
 for method in $methods; do
	echo "- $method"
 done
fi
