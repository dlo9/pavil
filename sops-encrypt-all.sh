#!/bin/sh
#
# In-place encrypts all k8s secrets using sops

find . -regex '.*\.sls\.yaml$' | xargs -n 1 sops -e -i
