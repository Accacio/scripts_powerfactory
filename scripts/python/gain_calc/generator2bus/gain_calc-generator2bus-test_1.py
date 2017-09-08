import csv
import sys
import powerfactory as pf
import tkinter as tk
from tkinter import filedialog

# Initialize project
app = pf.GetApplication()
app.ResetCalculation()
app.ClearOutputWindow()

ldf = app.GetFromStudyCase('ComLdf')
app.EchoOff()
#   Execute and find for errors
ierr = ldf.Execute()
if ierr:
    exit()
app.EchoOn()

#   Initialize buses, lines and loads
buses = app.GetCalcRelevantObjects('*.ElmTerm')
lines = app.GetCalcRelevantObjects('*.ElmLne')
loads = app.GetCalcRelevantObjects('*.ElmLod')
pv_generators= app.GetCalcRelevantObjects('*.ElmPvsys')

# Get name of generators and respective buses
pv_generators_names=[]
pv_generators_busnames=[]
for pv_generator in pv_generators:
    pv_generators_name=pv_generator.GetAttribute('loc_name')
    pv_generators_busname=pv_generator.GetAttribute('bus1').cterm.loc_name
    pv_generators_names=pv_generators_names+[pv_generators_name]
    pv_generators_busnames=pv_generators_busnames+[pv_generators_busname]

# Creates array of buses where generators are connected to
Ubus_before=[]
pv_buses=[]
for bus in buses:
    if bus.loc_name in pv_generators_busnames:
        # app.PrintPlain(bus.loc_name)
        pv_buses=pv_buses+[bus]
        Ubus_before = Ubus_before + [bus.GetAttribute('m:Ul')]
# app.PrintPlain(Ubus_before)

# Reduces* the reactive power of one generator,
#   measure the voltage of each bus, calculate Gain
#   and reduces again the reactive power
# Then repeats to all generators
#
#   *reactive power is reduced by 0.2 the nominal Active Power,
#
M_Ubus_after = []
M_Gain=[]
for pv_generator in pv_generators:
    qgini_before=pv_generator.qgini
    qgini_after=qgini_before-0.2*pv_generator.Pnom
    app.PrintPlain(qgini_before)
    app.PrintPlain(pv_generator.Pnom)
    app.PrintPlain(qgini_after)
    pv_generator.qgini=qgini_after
    app.EchoOff()
    ierr = ldf.Execute()
    if ierr:
        exit()
    app.EchoOn()
    Ubus_after = []
    Gain=[]
    bus_index=0
    for bus in pv_buses:
        Ubus_actual=bus.GetAttribute('m:Ul')
        Ubus_after = Ubus_after + [Ubus_actual]
        Gain=Gain+["{0:.1e}".format((Ubus_actual-Ubus_before[bus_index])/(qgini_after-qgini_before))]
        bus_index += 1
    M_Gain=M_Gain+[Gain]
    pv_generator.qgini=qgini_before
    # app.PrintPlain(pv_generator.qgini)
    app.EchoOff()
    ierr = ldf.Execute();
    if ierr:
        exit()
    app.EchoOn()
app.PrintPlain(pv_generators_busnames)
for i in pv_generators:
    app.PrintPlain(i)
for i in M_Gain:
    app.PrintPlain(i)

# Save Gain matrix in a .csv file
root = tk.Tk()
root.withdraw()
file_name_ = filedialog.asksaveasfilename(initialfile='gain_generator2bus-test_1',title='Select a location to save the CSV file',filetypes=[('Semicolon Separated Value file', '*.csv')],defaultextension=".csv")
if not file_name_:
    app.PrintPlain('No file chosen, cancelling...')
    exit()
with open(file_name_,'w',encoding='utf-8',newline='') as csvfile:
    line_file = csv.writer(csvfile, delimiter=';')
    for Gain in M_Gain:
        line_file.writerow(Gain)
