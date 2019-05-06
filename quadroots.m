%Quadratic Formula Program
%Created on: 5, November, 2018
%Created by: Isaac Pritchard
%Description: Code will find both the number of the roots of a given
%quadratic equation, and display the values of those roots, given the
%inputs of a, b, and c values from the user

disp('for the equation ax^2+bx+c\n')

a=input('enter value of a\n')
b=input('enter value of b\n')
c=input('enter a value of c\n')

D=b.^2-4*a.*c

if D>0;
    fprintf('There are two real roots\n')
    root1=((-b)+D.^(1/2))/(2*a)
    root2=((-b)-D.^(1/2))/(2*a)
elseif D==0
    fprintf('There is one real root\n')
    root3=(-b)/(2*a)
else
    fprintf('Sorry bud, NO ROOTS\n')
end
    
    
