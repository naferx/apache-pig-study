### Apache Pig Study
 
Basic experiments to understand Apache Pig features

#### Prerequisites
It is expected to download and install JRE 11, Apache Hadoop 3.3.x, Apache Hbase 2.5.X and Apache Pig and set the respective `JAVA_HOME, HADOOP_HOME, HBASE_HOME, PIG_HOME` environment variables to the root directories of each technology.


#### Loading data

In order to load the initial data into a HBase table, start a local HBase instance `.$HBASE_HOME/bin/start-hbase`, then run the script `./import_data_hbase.sh` which will create and populate a new table named 'clients'. See `input/hbase_commands.txt`


#### Running Apache Pig scripts
Inside the `pig`` folder you can find multiple Apache Pig scripts. 

Type in your terminal

```
    pig$ pig -x local csv_loader.pig

    pig$ pig -x local csv_to_parquet.pig
```


To check the output

`pig$ parquet schema ../output/parquet/export1/part-m-00000.snappy.parquet`

`pig$ parquet cat ../output/parquet/export1/part-m-00000.snappy.parquet`