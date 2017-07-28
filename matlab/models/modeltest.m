function [t, x, y] = modeltest
global u q Pmax x1 

options = simget('modeltest');
options = simset('InitialState', [x1]);
[t, x, y] = sim('modeltest', [], options);

