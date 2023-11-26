#!/usr/bin/sh

pig -x local \
 -verbose \
 -param outputLocation=data/output_4 \
 scripts/csv_exporter.pig