# SETS
set V;
set E within {V,V};

# PARAMETERS
param cost{(i,j) in E}, >= 0;
param capacity{(i,j) in E}, >= 0;
param source symbolic in V;
param demand{i in V} default 
if i=source then (-sum{j in V: j<>source} demand[j]);

# VARIABLES
var x{(i,j) in E}, binary;
var t{(i,j) in E}, >=0;

# OBJECTIVE FUNCTION
minimize total_cost: sum{(i,j) in E} cost[i,j] * x[i,j];

# CONSTRAINTS
subject to cap_constraint{(i,j) in E}:
t[i,j] <= x[i,j] * capacity[i,j];

subject to flow_equi{i in V}:
sum{j in V: (j,i) in E} t[j,i] - sum{j in V: (i,j) in E} t[i,j] = demand[i];


