function [ R, Nnoeuds, Nbranches ] = Chargement_Reseau( Scc )
%   Chargement_Reseau_TEST
%       Calculates Grid TEST parameters
%
%   Use:
%
%   [R, Nnoeuds, Nbranches] = Chargement_Reseau( Scc )
%
%       Where Scc is the Short-Circuit Power.
%
%   R - Structure with elements of the grid:
%
%       topo - Matrix of Topology of Grid
%           [No of Branch  Initial Node    End Node]
%
%       CaractBranches - Matrix of Branch
%           [No of Branch   Width   Impedance/km   Admittance/km]
%
%       consoHTA - Matrix of Consummers
%           [Node of Consummer   Active Power, Reactive Power 0]
%
%       prodHTA - Matrix of Productors
%           [Generator's node   Active Power    Reactive Power  -Reactive Power  1   0]
%
%
%   Nbranches - The number of connections in the grid (cables)
%
%   Nnoeuds - The number of nodes in the grid
%
%
Xcc =  (20.4e3)^2 / Scc;
Lcc = Xcc / (2 * pi * 50);
%% Topologie d'un depart
%Nombre de la branche, noeud amont, noeud aval
Topologie = [
    1   0   1;
    2   1   2;
    3   2   3;
    4   3   4;
    5   4   5;
    6   5   6;
    7   6   7;
    8   7   8;
    9   8   9;
    10  4   10;
    11  10  11;
    12  11  12;
    13  12  13;
    14  13  14];

R.topo = [1 0 1 ; Topologie + 1 ];
%% Caracteristiques des branches
%   Nombre du type,     Rl,         Ll,         Gl,             Cl
%                       Resistance, Inductance, Conductance,    Capacitance
Types_branches = [
    1                   .333        .382e-3     0               .25e-6;     %ARG7H1RX 120 mmq
    2                   .218        .350e-3     0               .29e-6;     %ARG7H1RX 185 mmq
    3                   .580        .414e-3     0               .21e-6;     %ARG7H1RX 70 mmq
    4                   .72         1.389e-3    0               .0083e-6;   %Aerea Cu 25 mmq
    5                   .2681       1.286e-3    0               .0090e-6;   %Aerea Cu 70 mmq
    6                   0           Lcc         0               0
    ];
%Nombre de la branche, longueur, type
Branches = [
    1   1       6;
    2   3.600   2;  %ARG7H1RX 185 mmq
    3   3.304   2;  %ARG7H1RX 185 mmq
    4   2.400   5;  %Aerea Cu 70 mmq
    5   3.600   5;  %Aerea Cu 70 mmq
    6   3       5;  %Aerea Cu 70 mmq
    7   2.4     3;  %ARG7H1RX 70 mmq
    8   3.08    5;  %Aerea Cu 70 mmq
    9   1.65    5;  %Aerea Cu 70 mmq
    10   1.8     5; %Aerea Cu 70 mmq
    11  2.2     5;  %Aerea Cu 70 mmq
    12  2.2     3;  %ARG7H1RX 70 mmq
    13  2.4     3;  %ARG7H1RX 70 mmq
    14  2.6     3;  %ARG7H1RX 70 mmq
    15  2.7     3   %ARG7H1RX 70 mmq
    ];

Zl = Types_branches(Branches(:,3),2) + 1i*2*pi*50*Types_branches(Branches(:,3),3);
Ygl = Types_branches(Branches(:,3),4) + 1i*2*pi*50*Types_branches(Branches(:,3),5);
R.CaractBranches = [Branches(:,1) Branches(:,2) Zl Ygl ];

%% Branches
R.branches=[Branches(:,1) Branches(:,1) Branches(:,2)];

%% ConsoHTA

%Noeud de raccordement, P (W) 1p.m., Q(VAr) 1p.m.
Conso_HTA = [
    1   .1894e6   .1265088e6;
    2   .1147e6   .0774413e6;
    3   .1155e6   .0782289e6;
    5   0e6       0e6;
    6   .1094e6   .0741473e6;
    7   .1450e6   .0984401e6;
    8   .3993e6   .2049369e6;
    9   .2471e6   .1656134e6;
    9   .6083e6   .2971269e6;
    9   .2094e6   .1407233e6;
    10  .1205e6   .08741e6;
    11  .1561e6   .0798601e6;
    12  .1934e6   .1347733e6;
    13  .0934e6   .0640347e6;
    14  .1333e6   .0923274e6;
    14  .5634e6   .2791258e6
    ];

R.consoHTA = [ Conso_HTA(:,1)+1 Conso_HTA(:,2:3) zeros( size( Conso_HTA, 1 ), 1 ) ];

%% Prod HTA
% Noeud de raccordement, puissance (W), tanphi_max, Q=P*tan cosphi= cos(atan(tanphi_max))
Prod_HTA = [
    3   2.06e6  .4;     %DG4 - PV
    5   3.25e6  .4;     %DG5 - TG
    11  4.95e6  .4;     %DG6 - AE
    ];

% Prod_HTA = [
%     3       3.2e6     .4;
%     5       5.5e6     .4;
%     11      5.5e6     .4;
%     ];

R.prodHTA = [ Prod_HTA(:,1)+1 Prod_HTA(:,2) Prod_HTA(:,2).*Prod_HTA(:,3) -Prod_HTA(:,2).*Prod_HTA(:,3) ones( size( Prod_HTA, 1 ), 1) zeros( size( Prod_HTA, 1 ), 1)];

%% Nnoeuds et Nbranches
Nbranches = [ 1 size(Zl,1)];
Nnoeuds = [ 1 max( max( R.topo( :, 2:3 ) ) )];



end
