-- File: csv-exporter.pig
-- Date: 2023-11-24
 
DEFINE CSVStorage org.apache.pig.piggybank.storage.CSVExcelStorage(
        ',', 'NO_MULTILINE', 'UNIX', 'WRITE_OUTPUT_HEADER'
    );

clients = LOAD 'hbase://clients' USING 
                                org.apache.pig.backend.hadoop.hbase.HBaseStorage(
                                    'personal:id, personal:name', '-loadKey true'
                                ) AS (rowId: int, id: chararray, name: chararray);


STORE clients INTO '../output/csv/export1' USING CSVStorage;
