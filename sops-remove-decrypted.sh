#!/bin/sh
#
# Removes any files previously decrypted with sops-decrypt-all.sh

find . -regex '.*\.sls\.yaml$' | sed 's/\.yaml$//' | xargs rm 
