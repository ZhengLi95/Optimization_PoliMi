function [xstar, fstar, counter, error, flocals, fstars, nstars] = ...
    multistart(f, n, eps, localeps, maxit, maxlocalit, myLocalOptimAlg)
    
    fstars = []; % estimate of the optimal value of the global objective function
    nstars = []; % iteration in which is updated the estimate of the optimal value
    flocals = []; % optimal value of the local objective function
    
    bound = 5;
    x = rnd(n, bound);
    xstar = x;
    counter = 0;
    termination = 0;
    
    while termination == 0
        fstar = feval(f, xstar);
        if fstar < eps | counter >= maxit
            termination = 1;
        else
            counter = counter + 1;
            [xlocal, flocal, count, err] = myLocalOptimAlg(f,x,localeps,maxlocalit);
           flocals = [flocals; flocal];
           if flocal < fstar
                xstar = xlocal;
                fstar = flocal;
                error = err;
                fstars = [fstars;fstar];
                nstars = [nstars;counter];
            end
            x = rnd(n, bound);
        end
    end
        
end
