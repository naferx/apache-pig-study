REGISTER ../lib/parquet-pig-bundle-1.13.1.jar

DEFINE ParquetStorer org.apache.parquet.pig.ParquetStorer();

records = LOAD 'hbase://clients' USING 
                                org.apache.pig.backend.hadoop.hbase.HBaseStorage(
                                     'personal:id, personal:name', '-loadKey true'
                                ) AS (rowId: int, id: chararray, name: chararray);

STORE records INTO '../output/data3' USING ParquetStorer;