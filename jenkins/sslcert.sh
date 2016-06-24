#!/usr/bin/env bash

# SSL certificate dir
SSL_DIR="/var/jenkins_home/sslcert"

# Keystore
SSL_KEYSOTRE="$SSL_DIR/jenkins_keystore.jks"

# Server path to SSL certificate
SSL_CERTIFICATE="$SSL_DIR/server.crt"

# Server path to SSL certificate key
SSL_CERTIFICATE_KEY="$SSL_DIR/server.key"


# generate cert and pk if doesn't exist

if [ -f $SSL_CERTIFICATE &&  -f $SSL_CERTIFICATE_KEY ];
then
   echo "SSL certificate exist"
else

    # Certificate subject
    SSL_CERTIFICATE_SUBJECT="/C=UK/ST=Scotland/L=Dundee/O=OME/CN=SPACENAME-ci.openmicroscopy.org"

    # Certificate validity (days)
    SSL_CERTIFICATE_DAYS=365

    keytool -genkey -keyalg RSA -alias selfsigned -keystore $SSL_KEYSOTRE -storepass mypassword -keysize 2048

    openssl req -new -nodes -x509 -subj "$SSL_CERTIFICATE_SUBJECT" -days $SSL_CERTIFICATE_DAYS -keyout $SSL_CERTIFICATE_KEY -out $SSL_CERTIFICATE -extensions v3_ca

    keytool -importkeystore -srckeystore $SSL_CERTIFICATE -srcstoretype PKCS12 -destkeystore $SSL_KEYSOTRE -deststoretype JKS
    keytool -importcert -keystore $SSL_KEYSOTRE -trustcacerts -alias jenkinsCA -file $SSL_CERTIFICATE

fi

