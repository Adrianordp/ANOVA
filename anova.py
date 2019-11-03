# Code beginning --------------------
import sys
import os
import csv
import numpy as np

# get file root
root = os.path.dirname(os.path.abspath(__file__)) + '/'
# Recieve file name
fileName  = sys.argv[1]
# Create file path
filePath = root+fileName
with open(filePath, 'r') as f:
    reader = csv.reader(f, delimiter=',')
    # get header from first row
    headers = next(reader)
    # get all the rows as a list
    data = list(reader)
    # transform data into numpy array
    data = np.array(data).astype(float)

print(headers)
print(data.shape)
print(data)
x = data[:,0]
y = data[:,1]
z = data[:,2]
print('Médias locais:', end = ' ')
print(np.mean(x), end = ' ')
print(np.mean(y), end = ' ')
print(np.mean(z))
print('Covariâncias:', end = ' ')
print(np.cov(x), end = ' ')
print(np.cov(y), end = ' ')
print(np.cov(z))
print('Média global:', end = ' ')
print(np.mean(data))
# print(np.sum(x**2))
