function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%Function Will determine the root, value of the function at the root,
%approximate realtive error, and iteratios used of an input function using
%false position method with the inputs:
    
%INPUTS
    %func:    Input function
    %xi & xu: Initial bracketing guesses of the root
    %es:      Stopping criteria (Defaults to .0001%
    %maxiter: Maximum number of iterations used (Defaults to 200)

%OUTPUTS
    %root:    guess of root once max iterations or stopping criteria is
    %         met
    %fx:      Value of the function at the final guess
    %ea:      Approximate relative error of final guess
    %iter:    Number of iterations used to calculate final guess
    

%Ensuring that "es" and "maxiter" default to specified parameters
if nargin == 3
    es = .0001;
    maxiter=200;
elseif nargin == 4
    maxiter=200;
elseif nargin < 3
    error('You must input a function, and two guesses to start')
end

%Ensuring that the initial guesses bracket a root
if func(xl) * func(xu) > 0
    error('The initial guesses must bracket a root.')
end

%Defining starting variables: 
%count:  count for the iterations, 
%e:  for the starting error which will be large, hence starting at 1, or 100%
%"xr" for the initial root which will be zero

count=0;
ea=100;
xr1=0;

%While loop will calculate new estimates of the root (xr1) until the
%stopping criteria is met, or the max number of iterations has taken place.
while ea > es && count < maxiter
   
    %Adds 1 to variable count each time loop is performed
    count=count+1; 
  
    %Re-defining the old guess 
    xr=xr1;
    
    %Calculating the new guess, "xr1" 
    xr1=xu-(func(xu)*(xl-xu))/(func(xl)-(func(xu)));
   
    %Replaces "xl" or "xu" with "xr1" depending on the sign of "xr1"
    if func(xr1) * func(xu) > 0
        xu = xr1;     
    else
        xl = xr1;
    end
    
    %Calculating the approximate relative error
    ea = abs((xr1-xr)/xr1)*100;
end
   

    % Defining outputs
    fx = func(xr1) %#ok<NOPRT>
    
    iter = count %#ok<NOPRT>
    
    ea = ea %#ok<ASGSL,NOPRT>
    
    root = xr1
    
end


