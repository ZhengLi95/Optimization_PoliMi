# SETS
set food;
set nutrition;

# PARAMETERS
param content{nutrition, food};
param required{nutrition};
param cost{food};

# VARIABLES
var usage{food} >= 0;

# OBJECTIVE FUNCTION
minimize tt_cost: sum{i in food} cost[i] * usage[i];

# RESTRAINTS
subject to nut_req{i in nutrition}: 
sum{j in food} content[i, j] * usage[j] >= required[i];




