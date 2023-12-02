DEFINE CSVStorage org.apache.pig.piggybank.storage.CSVExcelStorage(
        ',', 'NO_MULTILINE', 'UNIX', 'WRITE_OUTPUT_HEADER'
    );

users = LOAD '../input/users.avro' USING AvroStorage();


STORE users INTO '../output/csv/avro-export' USING CSVStorage;
