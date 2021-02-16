#!/bin/sh
#
# Decrypts all encrypted pillar files

find . -regex '.*\.sls\.yaml$' | sed 's/\.yaml$//' | xargs -I "{}" sops -d --output "{}" "{}.yaml"
