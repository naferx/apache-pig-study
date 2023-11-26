 ### Apache Pig Study
 

#### 

Storing data into Apache HBase
In order to load initial data into a HBase table, run the script `./import_data_hbase.sh``


`parquet cat ../output/data3/part-m-00000.parquet`

 pig -param data=mydata myscript.pig

 /home/naf/tools/pig-0.17.0/lib/piggybank.jar


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