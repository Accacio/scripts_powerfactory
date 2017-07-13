import powerfactory as pf

app = pf.GetApplication()
app.ClearOutputWindow()

ldf = app.GetFromStudyCase('ComLdf')

ierr = ldf.Execute()
if ierr:
    exit()

buses = app.GetCalcRelevantObjects('*.ElmTerm')
lines = app.GetCalcRelevantObjects('*.ElmLne')
loads = app.GetCalcRelevantObjects('*.ELmLod')


Ubus_before=[]
bus_names=[]
for bus in buses:
    bus_name=bus.GetAttribute('loc_name')
    if bus_name.startswith('N'):
        bus_names = bus_names + [bus_name]
        Ubus_before = Ubus_before + [bus.GetAttribute('m:Ul')*1e3]
        #app.PrintPlain('Voltage on bus ' + str(bus) + ': ' + str(bus_v) + 'kV')




#app.PrintPlain(Ubus_before)
#for i in Ubus_before:
#    app.PrintPlain(i)
#app.PrintPlain("Number of loads = " + str(n_loads))


M_Ubus_after = []
M_Gain=[]
for load in loads:
    app.PrintPlain(load)
    load_name=load.loc_name
    app.PrintPlain(load.qlini)
    qlini_before = load.qlini*1e6
    app.PrintPlain(qlini_before)
    if load_name != 'C 2-23 MT ill':
        load.qlini=load.qlini*2
        qlini_after=load.qlini*1e6
    if load_name == 'C 2-23 MT ill':
        load.qlini=load.qlini+2
        qlini_after = load.qlini * 1e6
    app.PrintPlain(qlini_after)
    ierr = ldf.Execute();
    if ierr:
        exit()
    #app.PrintPlain(load.qlini)

    Ubus_after = []
    Gain=[]
    bus_index=0
    for bus in buses:
        bus_name = bus.GetAttribute('loc_name')
        if bus_name.startswith('N'):

            Ubus_actual=bus.GetAttribute('m:Ul')*1e3
            # app.PrintPlain(str(load_name) + " " + str(bus_name) )
            # app.PrintPlain("            ")
            # app.PrintPlain("Ubus_before")
            # app.PrintPlain(Ubus_before[bus_index])
            # app.PrintPlain("Ubus_actual")
            # app.PrintPlain(Ubus_actual)
            # app.PrintPlain("qlini_before")
            # app.PrintPlain(qlini_before)
            # app.PrintPlain("qlini_after")
            # app.PrintPlain(qlini_after)
            # app.PrintPlain("            ")
            Ubus_after = Ubus_after + [Ubus_actual]
            Gain=Gain+[(Ubus_actual-Ubus_before[bus_index])/(qlini_after-qlini_before)]
            bus_index += 1
                # app.PrintPlain('Voltage on bus ' + str(bus) + ': ' + str(bus_v) + 'kV')


    M_Ubus_after = M_Ubus_after + [Ubus_after]
    M_Gain=M_Gain+[Gain]
    if load_name != 'C 2-23 MT ill':
        load.qlini = load.qlini / 2
    if load_name == 'C 2-23 MT ill':
        load.qlini = load.qlini - 2
    ierr = ldf.Execute();
    if ierr:
        exit()






#app.PrintPlain(bus_names)
#app.PrintPlain("Ubus_before")
#app.PrintPlain(Ubus_before)
#app.PrintPlain("Ubus_after")
#for i in M_Ubus_after:
#    app.PrintPlain(i)

for i in M_Gain:
    app.PrintPlain(i)




#app.PrintPlain('Load' + str(load) + ' ' + str(load.qlini))