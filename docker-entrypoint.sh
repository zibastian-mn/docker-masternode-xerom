#!/bin/sh

if [ -z "$port" ]; then
	echo "-e port=xxx is missing. Exiting"
	exit 1
fi

if [ -s "/.nodeType" ]; then
	nodeType=$(cat /.nodeType)
fi

case "$nodeType" in
	"chain")
		OPTS="--syncmode fast"
		;;
	"xero")
		OPTS="--syncmode fast"
		;;
	"link")
		OPTS="--syncmode full --lightserv 50 --lightpeers 75"
		;;
	"super")
		OPTS="--syncmode full --lightserv 80 --lightpeers 100"
		;;
	*)
		echo "-e nodeType=chain|xero|link|super is missing. Exiting"
		exit 1
		;;
esac

echo -n ${nodeType} > /.nodeType

/usr/bin/geth ${OPTS} --port ${port} -node --cache=512 --datadir=$HOME/.xerom
