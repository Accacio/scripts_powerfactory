# scripts_powerfactory
Repository of tests in net model using DIgSILENT PowerFactory
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
+---documents
|   +---presentations
|   |   +---apresentacao
|   |   |   \---figures
|   |   |       \---Resultats
|   |   |           \---Cosson
|   |   \---presentation-2016_09_13
|   |       +---dir
|   |       \---figures
|   |           +---logos
|   |           +---Methodologie
|   |           |   +---partie_2
|   |           |   +---partie_3
|   |           |   \---partie_4
|   |           \---Resultats
|   |               +---Cosson
|   |               \---meus_resultados
|   \---rapports
|       +---IETR
|       |   \---Figuras
|       |       \---logos
|       +---resultats_jusq_20170828
|       |   \---Figuras
|       |       +---Division_du_travail
|       |       +---logos
|       |       \---Resultats
|       \---Supelec
|           +---Appendices
|           \---Figuras
|               +---Division_du_travail
|               +---logos
|               +---Methodologie
|               |   +---partie_2
|               |   +---partie_3
|               |   \---partie_4
|               \---Resultats
|                   \---discrete_control
|                       +---avec_perturbation
|                       |   \---puissance_charge
|                       \---sans_perturbation
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

### documents:
Presentations and Reports

### power_factory:
Net models

### scripts:
Scripts written in Matlab or Python
