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
|   \---graphs
|           graph.csv
|           
\---matlab
        all_data.mat

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

### :file_folder: [csv/graphs](csv/graphs)
---
Data in csv used to create graphs to be ploted, created by scripts in [python/simulation](python/simulation).
### :file_folder: [matlab](matlab)
---
Data created by scripts in [../matlab/conversion](../matlab/conversion).
