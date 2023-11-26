/*
 *
 *
 *  Input parameters:
 *      outputLocation: Specifies the output of the files
 *
 */

DEFINE HBaseStorage org.apache.pig.backend.hadoop.hbase.HBaseStorage; 

DEFINE csv_file 'output.csv';

data = LOAD 'hbase://test' USING HBaseStorage('cf:a', '') AS (id);

STORE data INTO '$outputLocation' USING PigStorage(',');