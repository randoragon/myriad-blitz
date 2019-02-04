/// @description toggle(var,val1,val2...)
/// @param var
/// @param val1
/// @param val2...

var output=argument[0];

if argument_count>=3
{
for(var argumentnumber=1; argumentnumber<=argument_count-1; argumentnumber++)
{if output==argument[argumentnumber] {if argumentnumber<argument_count-1 output=argument[argumentnumber+1]; else output=argument[1];}}
}

else

if argument_count==1 {if output==0 output=1; else output=0;}

argument[0]=output;
return argument[0];

