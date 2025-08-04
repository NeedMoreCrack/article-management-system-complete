#!/bin/bash

echo "Choose option :"
echo "1.startup project"
echo "2.shutdown project"
read enter
case $enter in
    "1")
	echo "choose 1 startup project ..."
	sudo docker compose up -d
	echo "done"
	;;
    "2")
	echo "choose 2 shutdown project ..."
	sudo docker compose down
	echo "done"
	;;
esac
