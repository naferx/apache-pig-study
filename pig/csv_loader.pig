records = LOAD '../input/sample.csv' USING PigStorage(',');
DUMP records;