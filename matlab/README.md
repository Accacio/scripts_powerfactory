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
- **[csv2mat.m](matlab\conversion\csv2mat.m)**  
Takes a csv file and converts it to a structure in a .mat file. The header is transformed in multiple structures and values are transformed in a vector.

### simulation
---
- **[chargement_Reseau.m](matlab\simulation\chargement_Reseau.m)** and **[runme.m](matlab\simulation\runme.m)**:  
Give Net parameters to load in other
runme.m calls Chargement_Reseau

### print
---
- **[printpdf](matlab\print\printpdf)**  
Print a plot in pdf
