#!/bin/bash

HOSTNAME=`/bin/cat /var/spool/ec2/meta-data/instance-id`
INTERVAL="${COLLECTD_INTERVAL:-5}"
PLUGIN_NAME='disc_space'
PLUGIN_INSTANCE='percent'
PLUGIN_TYPE='df_inp'

while sleep "$INTERVAL"
do
dfu_inp=`/bin/df -k |grep /mnt|awk '{print \$4}'`
dfu_wop=${dfu_inp%\%}
dff_wop=$((100-$dfu_wop))
ts=`date +%s`

echo "PUTVAL $HOSTNAME/$PLUGIN_NAME-$PLUGIN_INSTANCE/$PLUGIN_INSTANCE-used $ts:$dfu_wop"
echo "PUTVAL $HOSTNAME/$PLUGIN_NAME-$PLUGIN_INSTANCE/$PLUGIN_INSTANCE-free $ts:$dff_wop"
done
