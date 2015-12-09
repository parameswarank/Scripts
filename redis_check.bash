#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <port>"
  exit
fi

PORT=$1

nc 127.0.0.1 $PORT </dev/null
if [ $? -ne 0 ]; then
	echo "status err no server listening!"
else
  echo "status ok ok"
fi
