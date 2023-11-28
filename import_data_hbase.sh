#!/usr/bin/bash

echo "[+] importing sample data to HBase ..."
$HBASE_HOME/bin/hbase shell -d ./input/hbase_commands.txt