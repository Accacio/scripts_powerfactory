function [t, x, y] = modeltest
global u a pmax x1
options = simget('modeltest_model');
options = simset('InitialState', [x1]);
[t, x, y] = sim('modeltest_model', [], options);