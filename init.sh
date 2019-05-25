#!/bin/sh

[ -f /etc/gost/gost.json ] || cp /tmp/gost.json /etc/gost/gost.json
/usr/bin/gost -C /etc/gost/gost.json
