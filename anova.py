# Code beginning --------------------
import csv
import sys
import os

# get file root
root = os.path.dirname(os.path.abspath(__file__)) + '/'
# Recieve file name
fileName  = sys.argv[1]
# Create file path
filePath = root+fileName

fields = []
rows = []

# Begin logic
with open(filePath,'r') as outfile:
    dados = csv.reader(outfile)
    fields = csvreader.next();
    for row in csvreader:
        rows.append(row)

    # get total number of rows
    print("Total no. of rows: %d"%(csvreader.line_num))

# printing the field names 
print('Field names are:' + ', '.join(field for field in fields))

#  printing first 5 rows
print('\nFirst 5 rows are:\n')
for row in rows[:5]:
    # parsing each column of a row
    for col in row:
        print("%10s"%col),
    print('\n')
