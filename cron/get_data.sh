#!/bin/bash

NODEJSON="/var/www/ffmap/data/spr/nodes.json"
ALFREDWEB="/var/www/ffmap/sprockhoevel/alfred"

## Tunneldigger VPN
cat $NODEJSON | jq '.nodes | .[] | {name: .nodeinfo.hostname, kontakt: .nodeinfo.owner.contact, online: .flags.online, vpn: .nodeinfo.software.tunneldigger.enabled, adresse: .nodeinfo.network.addresses}' | grep -v fe80 | sed '/2a03/s/,//g' | sed '$d;1d' | sed 's/}/},/' | sed 's/null/"unbekannt"/' | sed '1 i\[{' | sed '$ c\]}]' >$ALFREDWEB/knotenliste.json

## fastd -- ungetestet!
#cat $NODEJSON | jq '.nodes | .[] | {name: .nodeinfo.hostname, kontakt: .nodeinfo.owner.contact, online: .flags.online, vpn: .nodeinfo.software.fastd.enabled, adresse: .nodeinfo.network.addresses}' | grep -v fe80 | sed '/2a03/s/,//g' | sed '$d;1d' | sed 's/}/},/' | sed 's/null/"unbekannt"/' | sed '1 i\[{' | sed '$ c\]}]' >$ALFREDWEB/knotenliste.json
