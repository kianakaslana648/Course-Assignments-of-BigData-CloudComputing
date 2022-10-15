hadoop fs -cp s3://bigdatateaching/quazyilx/quazilx2.txt s3://mc2582-labdata/quazyilx/quazyilx2.txt
hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -D mapreduce.job.reduces=0 -input s3://mc2582-labdata/quazyilx/quazyilx2.txt -output s3://mc2582-labdata/a4/quazyilx-failures2 -mapper "grep -E 'fnard:-1 fnok:-1 cark:-1 gnuck:-1'"
hadoop jar /usr/lib/hadoop/hadoop-streaming.jar -D mapred.reduce.tasks=1 -input s3://mc2582-labdata/a4/quazyilx-failures2 -output s3://mc2582-labdata/a4/quazyilx-failures2-result -mapper cat -reducer cat
hadoop fs -cp s3://mc2582-labdata/a4/quazyilx-failures2-result/part-00000 ./
hadoop fs -get part-00000 ~/
cd
mv part-00000 fall-2022-a04-kianakaslana648/
cat part-00000 | sort > quazyilx-failures.txt
rm part-00000
