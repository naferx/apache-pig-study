line = LOAD '../input/paper.txt' AS (line: chararray);

words = FOREACH line GENERATE FLATTEN(TOKENIZE(line, ' ')) AS word;

grouped = GROUP words BY word;

wordcount = FOREACH grouped GENERATE group, COUNT(words);

DUMP wordcount;