#!/usr/bin/python3
# Code beginning --------------------
import os
import csv
import numpy as np
import tkinter as tk

# get file root
root = os.path.dirname(os.path.abspath(__file__)) + '/'
# Recieve file name
# fileName  = sys.argv[1]
fileName = 'data.csv'
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

# print(headers)
# print(data.shape)
# print(data)
dataMean = []
for i in range(5):
    dataMean.append(0)
dataCov = []
for i in range(5):
    dataCov.append(0)
square = data*0
squareC = data*0
for i in range(0, 5):
    dataMean[i] = np.mean(data[:, i])
    dataCov[i] = np.cov(data[:, i])
    # print(dataMean[i])
    # print(dataCov[i])
    for j in range(0,5):
        square[j,i] = (data[j,i]-dataMean[i])**2
        squareC[j,i] = (data[j,i]-np.mean(dataMean))**2
        print(square[j,i])
s0 = np.sum(square[:, 0])
s1 = np.sum(square[:, 1])
s2 = np.sum(square[:, 2])
s3 = np.sum(square[:, 3])
s4 = np.sum(square[:, 4])
# print(s0)
# print(s1)
# print(s2)
# print(s3)
# print(s4)
# print('Médias locais:', end = ' ')
# print(np.mean(x), end = ' ')
# print(np.mean(y), end = ' ')
# print(np.mean(z))
# print('Covariâncias:', end = ' ')
# print(np.cov(x), end = ' ')
# print(np.cov(y), end = ' ')
# print(np.cov(z))
# print('Média global:', end = ' ')
# print(np.mean(data))
# print(np.sum(x**2))

def hello():
    label.config(text=str(s0))

window = tk.Tk()
window.title("Anova")

height = data.shape[0]+1
width = data.shape[1]+1
headers = np.array(headers)
for i in range(width-1):
    cell = tk.Label(window, text=str(headers[i]))
    cell.grid(row=0, column=i+1)
for i in range(1,height):
    for j in range(1,width):
        cell = tk.Label(window, text=str(data[i - 1, j - 1]))
        cell.grid(row=i, column=j)

# b = tk.Button(window, text="Mean", command=hello)
# b.grid(row=6, column=0)
cellMeanStr = tk.Label(window,text="Mean:")
cellMeanStr.grid(row=6, column=0)
cellSosStr = tk.Label(window,text="SoS:")
cellSosStr.grid(row=7, column=0)
for i in range(width-1):
    cellMean = tk.Label(window,text=str(dataMean[i]))
    cellMean.grid(row=6, column=i+1)
    cellSos = tk.Label(window,text=str(np.sum(square[:,i])))
    cellSos.grid(row=7, column=i+1)

cellSosTStr = tk.Label(window, text="SoST:")
cellSosTStr.grid(row=8, column=0)
cellSosT = tk.Label(window,text=str(np.sum(square)))
cellSosT.grid(row=8, column=1)

window.mainloop()