#!/usr/bin/env python

import sys

if __name__ == "__main__":
	month_dict = {'Jan': '01', 'Feb': '02', 'Mar':'03', 'Apr':'04', 'May':'05', 'Jun':'06','Jul':'07','Aug':'08', 'Sep':'09','Oct':'10','Nov':'11','Dec':'12'}
	for line in sys.stdin:
		timestamp = line.split(' ')[3]
		month = month_dict[timestamp[4:7]]
		year = timestamp[8:12]
		sys.stdout.write("{}-{}\t1\n".format(year,month))
