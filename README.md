# scripts_powerfactory
Repository of tests in net model using DIgSILENT PowerFactory

Documents in [scripts_powerfactory_docs](https://github.com/Accacio/scripts_powerfactory/tree/docs)
## Folder Tree:


```
+---data
|   +---input
|   |   +---csv
|   |   |   +---generators
|   |   |   \---loads
|   |   \---excel
|   |       +---generators
|   |       \---loads
|   \---output
|       +---csv
|       |   +---gains
|       |   \---simulations
|       |       \---discrete_control
|       |           +---avec_perturbation
|       |           |   \---puissance_charge
|       |           \---sans_perturbation
|       +---img
|       |   \---simulations
|       |       \---discrete_control
|       |           +---avec_perturbation
|       |           |   \---puissance_charge
|       |           \---sans_perturbation
|       \---matlab
|           \---simulations
|               \---discrete_control
|                   +---avec_perturbation
|                   |   \---puissance_charge
|                   \---sans_perturbation
+---power_factory
|   \---networks
|       +---model_with_continous_control
|       \---model_with_discrete_control
\---scripts
    +---matlab
    |   +---conversion
    |   \---print
    \---python
        +---gain_calc
        |   +---generator2bus
        |   \---load2bus
        +---load_data
        \---simulation

```

## Contents:
### data:
I/O Data of net model

### power_factory:
Net models

### scripts:
Scripts written in Matlab or Python
