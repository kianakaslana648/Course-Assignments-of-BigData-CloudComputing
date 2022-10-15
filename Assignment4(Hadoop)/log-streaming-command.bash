hadoop fs -cp s3://bigdatateaching/forensicswiki/2012_logs.txt s3://mc2582-labdata/a4/
hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -files mapper.py,reducer.py -input s3://mc2582-labdata/a4/2012_logs.txt -output s3://mc2582-labdata/a4/log_file_result -mapper mapper.py -reducer reducer.py
hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -D mapred.reduce.tasks=1 -input s3://mc2582-labdata/a4/log_file_result -output s3://mc2582-labdata/a4/log_file_final_result -mapper cat -reducer cat
hadoop fs -cp s3://mc2582-labdata/a4/log_file_final_result/part-00000 ./
hadoop fs -get part-00000 ~/
cd
mv part-00000 fall-2022-a04-kianakaslana648/
cd fall-2022-a04-kianakaslana648/
cat part-00000 | tr '\t' ',' > logfile-counts.csv
rm part-00000
