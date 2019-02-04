/// @description gaussian_random(mean,acceptable_range,'total_range)
/// @param mean
/// @param acceptable_range
/// @param 'total_range
/*
Gauss distribution is infinite, meaning it grows from 0 to -/+ infinity continuously.
Therefore, setting a "range" of the random numbers is forcing the program to repeat
generating new numbers until the given range of numbers is met.

Mean is the number that's in the middle of the distribution,
the one that's most likely going to get generated as the result.

Acceptable Range is the range around mean that this function can return.
If mean==0.5 and acceptable_range==0.5, the resulting number is going to be from 0 to 1.

Total Range is the range of the gaussian distribution graph that's taken into account.
As mentioned earlier, the "full" graph is of infinite width, so this parameter lets you
select how much of it will be taken into account.
The higher the total range is, the steeper the curve will be in the center, resulting in
more common low results and less common "peak" results.
The measure for Total Range is "Standard Deviation". Default for this is 4. Needsn't to be integer.
The lower this value is, the more likely it's going to be necessary to loop, so it's more stable at high values.
*/
var u1=random(1);
var u2=random(1);
var total_range;
if argument_count<3 {
total_range=4;
} else {
total_range=argument[2];
}

var result; var tries=0;
do {
result=sqrt(-2*ln(u1))*cos(2*pi*u2);
tries++;
}
until((result>=-total_range && result<=total_range) or tries>10)
if tries>10 return argument[0];

result=(result+total_range)/(2*total_range); //elevate the result to a range of <0;1>
result*=2*argument[1]; //rescale the result to a range of <0;2*acceptable_range>
result+=argument[0]; //shift the result to <mean-acceptable_range;mean+acceptable_range>
return result;

