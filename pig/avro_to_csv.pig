DEFINE CSVStorage org.apache.pig.piggybank.storage.CSVExcelStorage(
        ',', 'NO_MULTILINE', 'UNIX', 'WRITE_OUTPUT_HEADER'
    );


--fs -rm -fr '../output/csv/avro-export'


--deserialized_users = LOAD '../input/users.avro' USING AvroStorage();

--serialized_user = LOAD '../input/users.avro' USING PigStorage()
serialized_user = LOAD '../input/users.avro' using BinStorage();
--a = load 'g/part*' using BinStorage('Utf8StorageConverter')

--DUMP serialized_user;

--STORE serialized_user into '../output/csv/avro-export'
STORE serialized_user INTO 'hbase://users' USING
                        org.apache.pig.backend.hadoop.hbase.HBaseStorage('data:details');



-- clients = LOAD 'hbase://clients' USING 
--                                 org.apache.pig.backend.hadoop.hbase.HBaseStorage(
--                                     'personal:id, personal:name', '-loadKey true'
--                                 ) AS (rowId: int, id: chararray, name: chararray);

-- STORE users INTO '../output/csv/avro-export' USING CSVStorage;
