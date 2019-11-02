# Code beginning --------------------
import sys
import os

# get file root
root = os.path.dirname(os.path.abspath(__file__)) + '/'
# Recieve file name
fileName  = sys.argv[1]
# Create file path
filePath = root+fileName

# Begin logic
with open(filePath) as outfile:
    dados = outfile.read().split(' ')
    print(dados)
    if '\n' in dados[1]:
        print('tem')
    else:
        print('não tem')
