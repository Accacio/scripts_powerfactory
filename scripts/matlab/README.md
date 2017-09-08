# matlab
## Folder Tree:
```

+---conversion
|       csv2mat.m
|       
+---print
|       printpdf.m
|       
\---simulation
        Chargement_Reseau.m
        runme.m

```
### conversion
---
- **[csv2mat.m](conversion/csv2mat.m)**  
Takes a csv file and converts it to a structure in a .mat file. The header is transformed in multiple structures and values are transformed in a vector.
### print
---
- **[printpdf](print/printpdf)**  
Print a plot in pdf

### simulation
---
- **[chargement_Reseau.m](simulation/chargement_Reseau.m)** and **[runme.m](simulation/runme.m)**:  
Give Net parameters to load in other
runme.m calls Chargement_Reseau
