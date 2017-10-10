# power_factory
Net models
## Folder Tree:
```

\---networks
    |   Reseau_med_sans_cont.dz
    |   
    +---model_with_continous_control
    |       modeltest.m
    |       modeltest.p
    |       modeltest_model.mdl
    |       Reseau_med_test.pfd
    |       
    \---model_with_discrete_control
            modeltest.m
            modeltest.p
            modeltest_model.mdl
            Reseau_med.pfd
            Reseau_med_nosimulink.pfd
            Reseau_med_powerfactoryonly.pfd

```        

'.m' and '.p' are matlab functions and '.mdl' the control model in Simulink. 

### Reseau_med_sans_cont.dz
---
Right side branch of the same net model used in [Marjorie Cosson's Thesis](https://tel.archives-ouvertes.fr/tel-01374469/document), without controller.

### Reseau_med_test.pfd
---
Same net model but with a continuous controller.

### Reseau_med.pfd
---
Same net model with a discrete controller using filter created in PowerFactory, and Matlab et Simulink to design control law.

### Reseau_med_nosimulink.pfd
---
Same net model with a discrete controller using filter created in PowerFactory, and Matlab to design control law.

### Reseau_med_powerfactoryonly.pfd
---
Same net model with a discrete controller created using only functions of PowerFactory.
