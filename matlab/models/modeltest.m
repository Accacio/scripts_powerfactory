function [t, x, y] = modeltest
global u a pmax x1

options = simget('modeltest');
options = simset('InitialState', [x1]);
[t, x, y] = sim('modeltest', [], options);

