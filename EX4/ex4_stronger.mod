# SETS

set V;
set E within {V,V};
set K within V;


# PARAMETERS

param source symbolic in V;
param u{(i,j) in E}, >=0;
param f{(i,j) in E}, >= 0;

param b{i in V} default if i=source then (- sum{j in V: j<>source} b[j]);

param d{i in V, k in K} default if i<>source and i=k then b[i]
						else if i=source then -b[k]
						else 0;


# VARIABLES

var x{(i,j) in E}, binary;
var t{(i,j) in E, k in K}, >=0, <=u[i,j];


# OBJECTIVE FUNCTION

minimize fixed_costs: 
	sum{(i,j) in E} f[i,j]*x[i,j];


# CONSTRAINTS

subject to balance{i in V, k in K}:
	sum{(j,i) in E} t[j,i,k] - sum{(i,j) in E} t[i,j,k] = d[i,k];

subject to capacity{(i,j) in E, k in K}:
	t[i,j,k] <= min(u[i,j],b[k])*x[i,j];

subject to total_flow{(i,j) in E}:
	sum{k in K} t[i,j,k] <= u[i,j]; 