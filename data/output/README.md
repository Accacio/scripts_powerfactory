# data/output
Output data from scripts
## Folder Tree:
```

+---csv
|   +---gains
|   |       gain_generator2bus-test_1-1pm.csv
|   |       gain_generator2bus-test_1-7am.csv
|   |       gain_generator2bus-test_2-1pm.csv
|   |       
|   \---simulations
|       |   all_data.csv
|       |   
|       \---discrete_control
|           +---avec_perturbation
|           |   \---puissance_charge
|           |           control_disc_c29_P_50_a_0__4.csv
|           |           control_disc_c29_P_50_a_0__5.csv
|           |           control_disc_c29_P_50_a_0__6.csv
|           |           control_disc_c29_Q_50_a_0__4.csv
|           |           control_disc_c29_Q_50_a_0__5.csv
|           |           control_disc_c29_Q_50_a_0__6.csv
|           |           
|           \---sans_perturbation
|                   control_disc_a_0__4.csv
|                   control_disc_a_0__5.csv
|                   control_disc_a_0__6.csv
|                   
+---img
|   \---simulations
|       |   Puissance_Active_et_Reactive_de_la_Charge_C2_29_MT.pdf
|       |   Tension_des_Bus_N21_N23_et_N29.pdf
|       |   
|       \---discrete_control
|           +---avec_perturbation
|           |   \---puissance_charge
|           |           Tension_de_GD4_P=50%_a=0_4.pdf
|           |           Tension_de_GD4_P=50%_a=0_5.pdf
|           |           Tension_de_GD4_P=50%_a=0_6.pdf
|           |           Tension_de_GD4_Q=50%_a=0_4.pdf
|           |           Tension_de_GD4_Q=50%_a=0_5.pdf
|           |           Tension_de_GD4_Q=50%_a=0_6.pdf
|           |           Tension_et_Puissance_Reactive_de_GD4_P50_a0_4.pdf
|           |           Tension_et_Puissance_Reactive_de_GD4_P50_a0_5.pdf
|           |           Tension_GD4_Q=50%_a=0_4.pdf
|           |           
|           \---sans_perturbation
|                   Tension_de_GD4_GD5_et_GD6_a0_4.pdf
|                   Tension_de_GD4_GD5_et_GD6_a0_5.pdf
|                   Tension_de_GD4_GD5_et_GD6_a0_6.pdf
|                   
\---matlab
    \---simulations
        |   all_data.mat
        |   
        \---discrete_control
            +---avec_perturbation
            |   \---puissance_charge
            |           control_disc_c29_P_50_a_0__4.mat
            |           control_disc_c29_P_50_a_0__5.mat
            |           control_disc_c29_P_50_a_0__6.mat
            |           control_disc_c29_Q_50_a_0__4.mat
            |           control_disc_c29_Q_50_a_0__5.mat
            |           control_disc_c29_Q_50_a_0__6.mat
            |           
            \---sans_perturbation
                    control_disc_a_0__4.mat
                    control_disc_a_0__5.mat
                    control_disc_a_0__6.mat

```
### :file_folder: [csv/gains](csv/gains)
---
Gains calculated in [python/gain_calc](python/gain_calc)

Gains data in table as:

**generator2bus:**  

```
.-------.-------.-------.
|  N21  |  N29  |  N23  |
|  ---  |  ---  |  ---  |
|  GD4  |  GD4  |  GD4  |
:-------+-------+-------:
|  N21  |  N29  |  N23  |
|  ---  |  ---  |  ---  |
|  GD5  |  GD5  |  GD5  |
:-------+-------+-------:
|  N21  |  N29  |  N23  |
|  ---  |  ---  |  ---  |
|  GD6  |  GD6  |  GD6  |
'-------'-------'-------'
```
Bus Tension over generator reactive power in V/var.
<!--

**load2bus:**  

Bus Tension over load reactive power in  $^V/_{KVar}$.
| $\frac{N21}{GD4}$     | $\cdots$     |$\frac{N23}{GD4}$     |
|---|---|---|
| $\vdots$     | $\ddots$     |$\vdots$     |
| $\frac{N21}{GD6}$     | $\cdots$     |$\frac{N23}{GD6}$     |

-->

### :file_folder: [csv/simulations](csv/simulations)
---
Data in csv used to create graphs to be ploted, created by scripts in [python/simulation](python/simulation) or manually in PowerFactory.

### :file_folder: [img](img)
---
Graphs ploted and printed.

### :file_folder: [matlab](matlab)
---
Data created by scripts in [../../matlab/conversion](../../matlab/conversion).
