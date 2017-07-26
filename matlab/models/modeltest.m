function [t, x, y] = modeltest
global u qgini
Pmax=20000
options = simget('modeltest');
[t, x, y] = sim('modeltest', [], options);

