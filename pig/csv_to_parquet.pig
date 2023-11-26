REGISTER ../lib/parquet-pig-bundle-1.13.1.jar

DEFINE ParquetStorer org.apache.parquet.pig.ParquetStorer();

records = LOAD '../input/sample.csv' 
                USING PigStorage(',') AS (id: int, name: chararray);

STORE records INTO '../output/data2' USING ParquetStorer;