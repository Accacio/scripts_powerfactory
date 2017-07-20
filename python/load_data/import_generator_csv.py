import csv
import sys
import math
import powerfactory as pf
import tkinter as tk
from tkinter import filedialog

class csv_load():
    def __init__ (self, input):
        self.name = input[0]
        self.Pn = float(input[1])*1e3
        self.P = float(input[2])*1e3
        self.Q = float(input[3])*1e3

app = pf.GetApplication()
app.ResetCalculation()
app.ClearOutputWindow()

pv_generators= app.GetCalcRelevantObjects('*.ElmPvsys')

root = tk.Tk()
root.withdraw()
file_name_ = filedialog.askopenfilename(title='Select a CSV file with generator data to open',filetypes=[('Semicolon Separated Value file', '*.csv')])
# Handler for cancel button
if not file_name_:
    app.PrintPlain('No file chosen, cancelling...')
    exit()

csv_data={}
with open(file_name_, 'r') as csvfile:
    line_file = csv.reader (csvfile, delimiter=";")
    for i,row in enumerate(line_file):
        if i !=0:
            data_loaded=csv_load(row)
            csv_data.update({data_loaded.name:(data_loaded.Pn,data_loaded.P,data_loaded.Q)})

for pv_generator in pv_generators:
    if pv_generator.loc_name in csv_data:
        pv_generator.sgn=csv_data[pv_generator.loc_name][0]
        pv_generator.pgini=csv_data[pv_generator.loc_name][1]
        pv_generator.qgini=csv_data[pv_generator.loc_name][2]
        pv_generator.cosn=1
        pv_generator.P_max=pv_generator.sgn*pv_generator.cosn
        # app.PrintPlain(pv_generator.loc_name)
