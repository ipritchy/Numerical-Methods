function [L, U, P] = luFactor(A)

%**************************************************************************
%Created by: Isaac Pritchard
%Created on: April 1, 2019
%**************************************************************************
%Given the input of any n by n matrix, this function will perform LU
%factorization with partial pivoting if neccesary.
%**************************************************************************
%INPUT
%   A:  any n by n matrix
%**************************************************************************
%OUTPUTS:
%   L:  Lower triangular matrix
%   U:  Upper triangular matrix
%   P:  Pivot matrix
%***************************************************************************

%Ensure that the matrix is a square matrix
[m,n] = size(A);
if m ~= n || m && n == 1
    error('The input matrix must be a square matrix')
end 

%Define starting variables to enter pivoting loops with
%   L will start as the indentity matrix
   L=eye(n); P=eye(n); U=A;
    
%for each trial "t," loop will check if pivoting is necessary, pivot,
%perform elimination, and store values in L, U, and P accordingly
    for t=1:m-1 % m-1 trials needed
        pivotval=max(abs(U(t:m,t)));   %defines max value in column as pivotval
        for j=t:m
            if(abs(U(j,t))==pivotval) %checks if max value is in top row
                new=j;  %if yes, defines this value as new in to pivot
                break
            end
        end
        U([t,new],t:m)=U([new,t],t:m); %pivots row with max with top row in U
        L([t,new],1:t-1)=L([new,t],1:t-1); %pivotws L value used to elimnate to match row in U
        P([t,new],:)=P([new,t],:); %changes pivot matrix
        for j=t+1:m
            L(j,t)=U(j,t)/U(t,t); %calculates elimination multiplier
            U(j,t:m)=U(j,t:m)-L(j,t)*U(t,t:m); %eliminates desired element
        end
    end
end

