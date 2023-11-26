-- File: csv-exporter.pig
-- Date: 2023-11-24
-- Description: Extracts and exports data from HBase to S3 

REGISTER '/home/naf/tools/pig-0.17.0/lib/piggybank.jar';








-- input parameters
--  outputFolder

DEFINE CSVStorage org.apache.pig.piggybank.storage.CSVExcelStorage(
        ',', 'NO_MULTILINE', 'UNIX', 'WRITE_OUTPUT_HEADER'
    );

--DEFINE HBaseStorage org.apache.pig.backend.hadoop.hbase.HBaseStorage(
--        'cf:b', '-loadKey true'
--    );

--DEFINE outputLocation '$outputFolder'
--DEFINE dataSource 'hbase://test'

data = LOAD 'hbase://test' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
        'cf:b', '-loadKey true'
    ) AS (id, name);


STORE data INTO '$outputLocation' USING CSVStorage;
