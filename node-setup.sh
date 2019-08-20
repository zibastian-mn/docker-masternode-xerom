#!/bin/sh

case "$1" in
	"chain")
		;;
	"xero")
		;;
	"link")
		;;
	"super")
		;;
	*)
		echo "Usage $0 chain|xero|link|super"
		exit 1
		;;
esac

echo -n $1 > /.nodeType

killall geth
