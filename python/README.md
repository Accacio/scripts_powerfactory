# python
Python scripts
## Folder Tree:
```

+---gain_calc
|   +---generator2bus
|   |       gain_calc-generator2bus-test_1.py
|   |       gain_calc-generator2bus-test_2.py
|   |       
|   \---load2bus
|           gain_calc-load2bus.py
|           
+---load_data
|       import_generator_csv.py
|       import_load_csv.py
|       
\---simulation
        teste_simul.py

```

### gain_calc
---
Calculate gains between parts of the net, results are saved in [data\output](data\output)
#### generator2bus
Calculate gains between Generator and buses
- **[gain_calc-generator2bus-test_1](python\gain_calc\generator2bus\gain_calc-generator2bus-test_1)**:  
Takes voltage of buses where generators are connected, before and after change the reactive power of generator as shown:

<!-- Change to a figure -->
```

0               ____       ____
-0.2*Pnom           |_____|   

0                        ____       ____
-0.2*Pnom                    |_____|     

0                                 ____       ____
-0.2*Pnom                             |_____|

```
and then calculates the gain between the reactive power of the generator and the voltage of its respective buses.

- **[gain_calc-generator2bus-test_2](python\gain_calc\generator2bus\gain_calc-generator2bus-test_2)**:  
Takes voltage of buses where generators are connected, before and after change the reactive power of generator as shown:

<!-- Change to a figure -->
```

0                   _____
-0.2*Pnom      ____|     |____

0                            _____
-0.2*Pnom               ____|     |____

0                                     _____
-0.2*Pnom                        ____|     |____

```
and then calculates the gain between the reactive power of the generator and the voltage of its respective buses.
#### load2bus
Calculate gains between Loads and buses
- **[gain_calc-load2bus](python\gain_calc\load2bus\gain_calc-load2bus)**:  
Calculates gains between Loads and buses

### load_data
---
Load data into models
- **[import_load_csv](python\load_data\import_load_csv)**:  
Imports loads' data in a csv to model in Power Factory
- **[import_generator_csv](python\load_data\import_generator_csv)**:  
Imports generators' data in a csv to model in Power Factory

### simulation
---
- **[teste_simul](python\simulation\teste_simul)**:  
Test of simulation and creation of load events
