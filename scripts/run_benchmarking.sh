
OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
FILENAME=$OUTPUT_DIRECTORY/measurements_`date +%R`

touch $FILENAME.txt
for i in 100 100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000; do
    for rep in `seq 1 5`; do
        echo "Size: $i" >> $FILENAME.txt;
        ./src/parallelQuicksort $i >> $FILENAME.txt;
    done ;
done

perl scripts/csv_quicksort_extractor.pl < $FILENAME.txt > $FILENAME.csv
perl scripts/csv_quicksort_extractor2.pl < $FILENAME.txt > $FILENAME\_wide.csv
