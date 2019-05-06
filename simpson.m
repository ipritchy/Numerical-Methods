function [I] = simpson(x,y)
%**************************************************************************
%Created by: Isaac Pritchard
%Created on: April 15, 2019
%**************************************************************************
%Given the input of and x-values with corresponding y-values, simpson will
%compute a numerical estimation of the integral using simpson's 1/3 rule
%and trapezoidal rule
%**************************************************************************
%INPUT
%   x: X values of tabulated or function data
%   y: Y values of tabulated or function data
%**************************************************************************
%OUTPUTS:
%   I:  Integral value of given data
%********************************************************************

%calculates the range of a matrix that of the space between each x value
rang = range(x(2:end)-x(1:end-1));

%Shoots an error if the range is not zero: the values are not spaced
%equally
if rang > 0
    error('The values must be equally spaced in the x direction')
end

%Shoots an error if 
if length(x) ~= length(y)
    error('The values of the x and y matricies must have the same amount of values')
end

%For inputs with even spacing, this loop will use simpson's 1/3 rule by
%itself 
if rem(length(x),2) ~= 0 %If the input has even spacing
    i = 1; %Counter
    I = 0; %Initial value of the integral approximation
    while i < length(y) %Code will run through all the data points then stop
        val = ((x(2)-x(1))/3)*(y(i)+(4*y(i+1))+y(i+2)); %Simpson's 1/3 rule
        I = I + val; %Summing the values each iteration 
        i = i + 2; %Adding 2, only the value of y(i+2) is re-used
    end
end

%For inputs with odd spacing, this loop will estimate the integral using a
%combination of Simpson's 1/3 rule and the trapezoidal methhod
if rem(length(x),2) == 0 %If the input has odd spacing
    warning('The trapezoidal method will be used for the last interval') %Warn the user that trapezo
    i = 1;%Counter
    I = 0;%Initial value of intergral approximation
    while i < length(y)-1 %Runs through until the second to last space
        val = ((x(2)-x(1))/3)*(y(i)+(4*y(i+1))+y(i+2));
        I = I + val;
        i = i + 2;
    end
end
trap = (x(end)-x(end-1))*((y(end-1)+y(end))/2); %Trapezoidal method
I = I + trap; %Adds trapezoidal method calculation to I
end


