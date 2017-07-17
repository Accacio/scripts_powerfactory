import sys
import powerfactory as pf

# Initialize project
app = pf.GetApplication()
app.ResetCalculation()
app.ClearOutputWindow()

ldf = app.GetFromStudyCase('ComLdf')

#   Execute and find for errors
ierr = ldf.Execute()
if ierr:
    exit()

#   Initialize buses, lines and loads
buses = app.GetCalcRelevantObjects('*.ElmTerm')
lines = app.GetCalcRelevantObjects('*.ElmLne')
loads = app.GetCalcRelevantObjects('*.ElmLod')
pv_generators= app.GetCalcRelevantObjects('*.ElmPvsys')

pv_generators_names=[]
pv_generators_busnames=[]
for pv_generator in pv_generators:
    pv_generators_name=pv_generator.GetAttribute('loc_name')
    pv_generators_busname=pv_generator.GetAttribute('bus1').cterm.loc_name
    pv_generators_names=pv_generators_names+[pv_generators_name]
    pv_generators_busnames=pv_generators_busnames+[pv_generators_busname]

Ubus_before=[]
pv_buses=[]
for bus in buses:
    if bus.loc_name in pv_generators_busnames:
        pv_buses=pv_buses+[bus]
        Ubus_before = Ubus_before + [bus.GetAttribute('m:Ul')*1e3]
# app.PrintPlain(Ubus_before)




# Increases* the reactive power of one generator,
#   measure the voltage of each bus, calculate Gain
#   and reduces again the reactive power
# Then repeats to all generator
#
#   *reactive power is multiplied by 2,
#
M_Ubus_after = []
M_Gain=[]
for pv_generator in pv_generators:
    qgini_before=pv_generator.qgini
    qgini_after=pv_generator.qgini*2
    pv_generator.qgini=qgini_after
    ierr = ldf.Execute()
    if ierr:
        exit()

    Ubus_after = []
    Gain=[]
    bus_index=0
    for bus in pv_buses:
        Ubus_actual=bus.GetAttribute('m:Ul')*1e3
        Ubus_after = Ubus_after + [Ubus_actual]
        Gain=Gain+[(Ubus_actual-Ubus_before[bus_index])/(qgini_after-qgini_before)]
        bus_index += 1
    M_Gain=M_Gain+[Gain]
    pv_generator.qgini=qgini_before
    ierr = ldf.Execute();
    if ierr:
        exit()

app.PrintPlain(pv_generators_busnames)
for i in pv_generators:
    app.PrintPlain(i)
for i in M_Gain:
    app.PrintPlain(i)


#app.PrintPlain('Load' + str(load) + ' ' + str(load.qlini))
