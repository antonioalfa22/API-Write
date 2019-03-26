#!/bin/bash

# ========= hf-server ============
#
# Autor: Antonio Paya Gonzalez
#
# ================================

# ============ VARIABLES =============
DIR=$PWD/keys
BLOCKDIR="$1"
OPTS="-i"

function copyHfc(){
    cd $PWD
    if [ -d ./keys ]; then
        rm -rf ./keys
    fi

    echo 
    echo "---------- Copiando hfc-key-store --------------"
    echo
    mkdir keys
    cd $DIR

    cp -a $BLOCKDIR/hfc-key-store/brasil/. $DIR
}

function copyPeerOrderer(){
    echo 
    echo "---------- Copiando peer keys--------------"
    echo

    cd $DIR

    cp $BLOCKDIR/crypto-config/peerOrganizations/brasil.antonio.com/peers/peer0.brasil.antonio.com/msp/tlscacerts/tlsca.brasil.antonio.com-cert.pem $DIR

    echo 
    echo "---------- Copiando orderer keys--------------"
    echo

    cd $DIR

    cp $BLOCKDIR/crypto-config/ordererOrganizations/antonio.com/msp/tlscacerts/tlsca.antonio.com-cert.pem $DIR
}

copyHfc
copyPeerOrderer