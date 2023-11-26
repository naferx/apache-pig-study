#!/usr/bin/sh

rand=$RANDOM

pig -x local \
-param outputFolder=data/output_$rand \ 
parquet_exporter.pig