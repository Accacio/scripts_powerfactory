function [t, x, y] = modeltest
global u a pmax
% options = simget('modeltest_model');
% options = simset('InitialState', [x1]);

% g=u;
% QM=0.4*pmax;
% Qm=-0.4*pmax;
% UM=22;
% Um=18;
% U1=19;
% U2=19.25;
% U3=20.75;
% U4=21;
% y=QM*(g<U1)+(g-U2)*((QM)/(U1-U2)).*(g<=U2&g>=U1)...
%     +(g-U3)*((-Qm)/(U3-U4)).*(g<=U4&g>=U3)+Qm.*(g>U4)
% y=y'
% plot(g,y)
% x=[];
% t=[0 0.01]'

 [t, x, y] = sim('modeltest_model');