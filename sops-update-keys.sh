#!/bin/sh
#
# Updates all files to use keys in .sops.yaml

find . -regex '.*\.sls\.yaml$' | xargs -I "{}" sh -c 'yes | sops updatekeys "{}"'
