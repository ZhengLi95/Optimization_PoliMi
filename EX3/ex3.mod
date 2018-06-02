# SETS
set V ordered;
param n := card(V);
set POWERSET := 0 .. (2**n -1);
set S{k in POWERSET} := {i in V : (k div 2**(ord(i)-1)) mod 2 = 1};
set E := {i in V, j in V: ord(i) <> ord(j)};

# PARAMETERS
param c{E}, >=0;

# VARIABLES
var x{E}, binary;

# OBJECTIVE FUNCTION
minimize cost:
sum{(i,j) in E} c[i,j]*x[i,j];

# CONSTRAINTS
subject to degree_in{i in V}:
sum{j in V: (j,i) in E} x[j,i] = 1;
subject to degree_out{i in V}:
sum{j in V: (i,j) in E} x[i,j] = 1;
subject to cuts{k in POWERSET diff {2**n-1}: (k div 2**(1-1)) mod 2 = 1
and card(S[k]) > 1}:
sum{i in S[k], j in V diff S[k]: (i,j) in E} x[i,j] >= 1;
