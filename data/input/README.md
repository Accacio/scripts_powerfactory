# data/input
Data to be loaded in simulations
## Folder Tree:

```

+---csv
|   +---generators
|   |       generators_1am-Q_0.csv
|   |       generators_1pm-Q_-0_2.csv
|   |       generators_1pm-Q_0.csv
|   |       generators_1pm.csv
|   |       generators_7am-Q_0.csv
|   |       generators_7pm-Q_0.csv
|   |       
|   \---loads
|           loads_1am.csv
|           loads_1pm.csv
|           loads_7am.csv
|           loads_7pm.csv
|           
\---excel
    +---generators
    |       generators_1am-Q_0.xlsx
    |       generators_1pm-Q_-0_2.xlsx
    |       generators_1pm-Q_0.xlsx
    |       generators_7am-Q_0.xlsx
    |       generators_7pm-Q_0.xlsx
    |       
    \---loads
            loads_1am.xlsx
            loads_1pm.xlsx
            loads_7am.xlsx
            loads_7pm.xlsx

```

### :file_folder: [csv/generators](csv/generators) and [excel/generators](excel/generators)
---
Generators data in table as:
|Generator Name|Nominal Active Power|Active Power|Reactive Power|
|-|-|-|-|

#### Convention for file names:
**Ex.:**  
The file

```
generators_1am-Q_0.csv
```

**means:**  
Generators data in 1am and Initial Q=0.

And the file
```
generators_1pm-Q_-0_2.csv
```

**means:**  
Generators data in 1pm and Initial Q=-0.2.

### :file_folder: [csv/loads](csv/loads) and [excel/loads](excel/loads)
---
Loads data in table as:
|Load Name|Active Power|Reactive Power|
|-|-|-|

#### Convention for file names:
**Ex.:**  
The file

```
loads_1am.xlsx
```

**means:**
Loads data in 1am
