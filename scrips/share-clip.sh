#!/bin/bash
# share-clip - Share clipboard with phone

name='Redmi Note 12 Turbo'
# name='COR-AL10'
kdeconnect-cli -n $name --share-text $(xsel -bo)
if [ $? -ne 0 ]; then
    kdeconnect-cli -l
    kdeconnect-cli -n COR-AL10 --share-text $(xsel -bo)
fi
