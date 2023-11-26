/*
    Parameters
        - outputFolder: where the data will be stored
*/

-- imports
DEFINE HBaseStorage org.apache.pig.backend.hadoop.hbase.HBaseStorage; 

DEFINE csv_file 'output.csv';

data = LOAD 'hbase://test' USING HBaseStorage('cf:a', '') AS (id);

STORE data INTO 'testdata/$outputFolder' USING PigStorage(',');