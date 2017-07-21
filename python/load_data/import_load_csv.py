import csv
import sys
import powerfactory as pf
import tkinter as tk
from tkinter import filedialog

# Treatment of data to be loaded from csv
class csv_load():
    def __init__ (self, input):
        self.name = input[0]
        self.P = float(input[1])
        self.Q = float(input[2])

app = pf.GetApplication()
app.ResetCalculation()
app.ClearOutputWindow()

loads = app.GetCalcRelevantObjects('*.ElmLod')

# Open Csv file
root = tk.Tk()
root.withdraw()
file_name_ = filedialog.askopenfilename(title='Select a CSV file with load data to open',filetypes=[('Semicolon Separated Value file', '*.csv')])
# Handler for cancel button
if not file_name_:
    app.PrintPlain('No file chosen, cancelling...')
    exit()

# Creation of a dictionary where load name is the key
#       and content is a list with load parameters:
#       [Active Power, Reactive Power]
csv_data={}
with open(file_name_, 'r') as csvfile:
    line_file = csv.reader (csvfile, delimiter=";")
    for i,row in enumerate(line_file):
        if i !=0:
            data_loaded=csv_load(row)
            csv_data.update({data_loaded.name:(data_loaded.P,data_loaded.Q)})

# Load of dictionary data into loads in simulator
for load in loads:
    if load.loc_name in csv_data:
        load.plini=csv_data[load.loc_name][0]
        load.qlini=csv_data[load.loc_name][1]
        # app.PrintPlain(load.loc_name)
