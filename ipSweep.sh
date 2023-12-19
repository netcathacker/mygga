#!/bin/bash
# zebra hacker
# tr -d  as in delete

ver=1
while getopts "v" opt ; do
	case "$opt" in
		v) 	ver=0;  ;;
		*)	ver=1 ;;
	esac
done
# clean argument array from flags, before getting arguments
shift $(($OPTIND -1))

# the the sole argument, th ip address base
range=$1

# if no arg given print help text
if [[ -z $range ]] ; then
  echo 'ipSweep <ipaddress>'
  echo 'ipsweep 10.1.1 (example)'
  exit
fi


if [ $ver == 0 ] ; then
    for ip in `seq 1 254` ; do
      ping -W 0.1 -c 1 $range.$ip | tr -s '\n'
      echo
      echo
    done
    exit
fi

# comme3nt added
for ip in `seq 1 254` ; do
  ping -W 0.1 -c 2 $range.$ip | grep ttl | \
  cut -d " " -f 4 | tr -d :
done
