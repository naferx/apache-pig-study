REGISTER ../lib/parquet-pig-bundle-1.13.1.jar

-- -- parquet property options
SET mapreduce.job.user.name parquetExporter
SET parquet.page.size 1048576 -- this is your min read/write unit.
SET parquet.block.size 134217728 --  your memory budget for buffering data
SET parquet.compression snappy

DEFINE ParquetStorer org.apache.parquet.pig.ParquetStorer();

records = LOAD 'hbase://clients' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
          'personal:id, personal:name', '-loadKey true'
     ) AS (
          rowId: int, 
          id: chararray, 
          name: chararray
     );

STORE records INTO '../output/parquet/export1' USING ParquetStorer;