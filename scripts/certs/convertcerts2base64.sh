#!/usr/bin/env bash

OperatingSystemType=$(uname -s)

case ${OperatingSystemType} in
    'Darwin')
        EncodeCommand='base64'
        ;;
    'Linux')
        EncodeCommand='base64 -w 0'
        ;;
esac

rm -rf output && mkdir output

cat apiserver-key.pem | (eval ${EncodeCommand}) > output/apiserver-key.pem.txt
cat apiserver.pem | (eval ${EncodeCommand}) > output/apiserver.pem.txt
cat ca-key.pem | (eval ${EncodeCommand}) > output/ca-key.pem.txt
cat ca.pem | (eval ${EncodeCommand}) > output/ca.pem.txt
cat worker-key.pem | (eval ${EncodeCommand}) > output/worker-key.pem.txt
cat worker.pem | (eval ${EncodeCommand}) > output/worker.pem.txt
