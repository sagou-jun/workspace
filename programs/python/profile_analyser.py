import re
import sys
import csv

InstructionNameColumn = 3
EstimatedCycleColumn = 8


argv = sys.argv
argc = len(argv)

if argc < 2:
    print "Too Few Arguments. " + str(argc)
    print "Usage:: python pro_analysis.py [ProfileFileName]"
    sys.exit()

with open(argv[1],'r') as ProfileCsv:
    reader = csv.reader(ProfileCsv,delimiter='\t')
    
    count = 0
    for row in reader:
        if len(row) < 2:
            continue
