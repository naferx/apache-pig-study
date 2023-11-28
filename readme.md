### Apache Pig Study
 
Basic experiments to understand Apache Pig features

#### Prerequisites
It is expected to download and install JRE 11, Apache Hadoop 3.3.x, Apache Hbase 2.5.X and Apache Pig and set the respective `JAVA_HOME, HADOOP_HOME, HBASE_HOME, PIG_HOME` environment variables to the root directories of each technology.


#### Loading data

In order to load the initial data into a HBase table, run the script `./import_data_hbase.sh` which will create and populate a new table named 'clients'. See `input/hbase_commands.txt`


#### Running Apache Pig scripts
Inside the pig folder execute
`pig$ pig -x local csv_loader.pig`


`pig$ parquet schema ../output/data5/part-m-00000.snappy.parquet`

`pig$ parquet cat ../output/data3/part-m-00000.snappy..parquet`


`parquet cat strings-2.parquet `
 

 pig \
 -param SRC=data.txt  \ 
 -param DEST=../output/myFile.txt  \
 -param LOADER="'TextLoader() AS (line:chararray)'"  \ 
 -param GEN="clean.CLEAN_CSV(line)"  \
 -param STORAGE=PigStorage('|')"  \
 -f clean.pig


pig \
    -param outputLocation=s3://  \ 
    -param tableGenerationPrefix=gen  \ 
    -f csv_exporter.pig