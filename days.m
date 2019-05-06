function [nd] = days(mo, da, leap)
%nd function displays elapsed days in a year given the inputs of what
%month and day it is, and whether it is a leap year
months=[31 28 31 30 31 30 31 31 30 31 30 31];

if mo > 12
    error('Only 12 months in a year, buddy')
    
elseif leap < 0 || leap > 1
    error('Its either a leap year, or its not. Choose one.')
    
elseif mo == 4 || mo == 6 || mo == 9 || mo == 11 && da > 30
    error('30 days have September, April, June, and November')
    
elseif da > 31
    error('No months have more than 31 days')

elseif mo == 2 && da > 28
    error('February has 28 days')
    
else
nd=sum(months(1:mo-1))+da+leap;

end
    
    


