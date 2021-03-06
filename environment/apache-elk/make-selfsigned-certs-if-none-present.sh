#!/bin/bash

CERT_DIR=/usr/local/apache2/conf/external
CERT=$CERT_DIR/server.crt
KEY=$CERT_DIR/server.key

if [ ! -e "$CERT" -a ! -e "$KEY" ] ; then
    OLD_UMASK=$( umask )
    umask 0077
    openssl req -new -x509 -sha256 -days 3650 -set_serial $RANDOM -extensions v3_req -out $CERT -keyout $KEY -nodes <<-EOF
	.
	.
	
	.
	
	$SITE_PUBLIC_HOSTNAME
	
	EOF
	# Country
	# State
	# Locality
	# Organization
	# Organizational Unit
	# Common name
	# Email address
    umask $OLD_UMASK
fi

