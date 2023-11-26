REGISTER /home/naf/tools/pig-0.17.0/tmp/parquet-format-2.4.0.jar
-- REGISTER /home/naf/tools/pig-0.17.0/tmp/parquet-pig-bundle-1.13.1.jar
-- REGISTER /home/naf/tools/pig-0.17.0/tmp/parquet-hadoop-bundle-1.13.1.jar
-- 

-- -- parquet property options
SET parquet.page.size 1048576 -- default. this is your min read/write unit.
SET parquet.block.size 134217728 -- default. your memory budget for buffering data
SET parquet.compression snappy -- or you can use none, gzip, snappy

-- for more config properties https://github.com/apache/parquet-mr/blob/452c94d20abda0a83101d00f3b697e110d744942/parquet-hadoop/src/main/java/org/apache/parquet/hadoop/ParquetOutputFormat.java#L70

--DEFINE outputLocation '$outputFolder'
--DEFINE dataSource 'hbase://test'


data = LOAD 'hbase://test' USING 
            org.apache.pig.backend.hadoop.hbase.HBaseStorage('cf:a') AS (id);

STORE data INTO '$outputFolder' 
           USING org.apache.parquet.pig.ParquetStorer();