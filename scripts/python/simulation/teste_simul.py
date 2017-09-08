import csv
import sys
import powerfactory as pf
import tkinter as tk
from tkinter import filedialog

class csv_load():
    def __init__ (self, input):
        self.name = input[0]
        self.P = float(input[1])
        self.Q = float(input[2])

app = pf.GetApplication()
app.ResetCalculation()
app.ClearOutputWindow()

def setupSimulation(comInc, comSim):
  comInc.iopt_sim = "rms"
  comInc.iopt_real = 1
  comInc.iopt_show = 0
  comInc.iopt_adapt = 0
  comInc.dtgrd = 0.01
  comInc.tstart = -0.1
  comSim.tstop = 5

def runSimulation(comInc, comSim):
  app.EchoOff()
  comInc.Execute()
  comSim.Execute()
  app.EchoOn()

def clearSimEvents():
  faultFolder = app.GetFromStudyCase("Simulation Events/Fault.IntEvt")
  cont = faultFolder.GetContents()
  for obj in cont:
    obj.Delete()

def addRecordedResult(elmRes, obj, param):
  if type(obj) is str:
    for elm in app.GetCalcRelevantObjects(obj):
      elmRes.AddVariable(elm, param)
  elif type(obj) is list:
    for elm in obj:
      elmRes.AddVariable(elm, param)
  else:
    elmRes.AddVariable(obj, param)

def addLodEvent(obj, sec, dP,dQ):
  faultFolder = app.GetFromStudyCase("Simulation Events/Fault.IntEvt")
  event = faultFolder.CreateObject("EvtLod", obj.loc_name)
  event.p_target = obj
  event.time = sec
  event.dP = dP
  event.dQ = dQ

load_c=app.GetCalcRelevantObjects("C 2-29 MT ind.ElmLod")[0]
time = 0 # event time = 0 sec
clearTime = 0.23
dP=0
dQ=100

comInc = app.GetFromStudyCase("ComInc")
comSim = app.GetFromStudyCase("ComSim")
comInc.Execute()
elmRes = comInc.p_resvar

clearSimEvents()
setupSimulation(comInc, comSim)

addLodEvent(load_c,time,dP,dQ)
addLodEvent(load_c,clearTime,-dP,-dQ)

addRecordedResult(elmRes, load_c, "m:Psum:bus1")
addRecordedResult(elmRes, load_c, "m:Qsum:bus1")
runSimulation(comInc, comSim)
addLodEvent(load_c,1.5,0,+dQ)
setDesktop=app.GetGraphicsBoard()
viPage = setDesktop.GetPage('Simulations_Plot',1)
oVi = viPage.GetVI('LinePower','VisPlot',1)

oVi.AddVars(load_c, "m:Psum:bus1")
oVi.AddVars(load_c, "m:Qsum:bus1")

viPage.DoAutoScaleX()
viPage.DoAutoScaleY()

root = tk.Tk()
root.withdraw()
file_name_ = filedialog.asksaveasfilename(title='Select a location to save the CSV file',filetypes=[('Semicolon Separated Value file', '*.csv')],defaultextension=".csv")
comRes = app.GetFromStudyCase("ComRes")
comRes.pResult = elmRes
comRes.iopt_exp = 6 # to export as csv
comRes.ciopt_head = 1
comRes.iopt_locn = 1
comRes.f_name = file_name_ # File Name
comRes.iopt_sep = 0 # to use the system seperator
comRes.iopt_honly = 0 # to export data and not only the header
comRes.iopt_csel = 0 # export only selected variables
comRes.Execute()
