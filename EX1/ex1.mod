# Set
set I;

# Parameters
param profit{I};
param cost{I};
param almeno{I};
param almassimo;

# Variable
var usage{I} >= 0;

# Object Function
maximize audience: sum{i in I} profit[i] * usage[i];

# Constraints
subject to Amount: sum{i in I} cost[i] * usage[i] <= almassimo;
subject to Min_time{i in I}: usage[i] >= almeno[i];