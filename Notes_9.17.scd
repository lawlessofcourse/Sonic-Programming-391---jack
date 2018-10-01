//NOTES 9.17 SONIC PROGRAMMING
// assign that function to the envir variable 'a'
(
a = {
	arg in1=0, in2=2;
	var result;
	result = in1 + in2;
	result
}
)


//what is 'a'
a.dump;
//evaluate 'a' with default values
a.value;

//evaluate 'a' replacing 'in1' -> 40+2 = 42
a.value(40);

//evaluate 'a' replacing 'in1' and in2' -> 40+60=100
a.value(40,60);

//pass the return value to another variable
b = a.value(23, 42)
b



///////////////////////////////////////////////////////////////////
// this is similar
(
{
	SinOsc.ar(600);
}.play;
)
/////////////////////////////////////////////////////////////////////
// Moving on...
/*

What is the difference between arguments and variables in SC?

*/

(
{
	var sig;
	//initalize sig with the output is SinOsc
	sig = SinOsc.ar(300);
	//multiply sigby an amp mod sincosc
	sig = sig * SinOsc.ar(1, phase: 0, mul:0.5, add:0.5);

	//output sig.
	sig
}.play;
)

//use arguments for values objects or data that may change between instanciations or through external means
(
a = {
	var sig, mod;
	//initalize sig with the output is SinOsc
	sig = SinOsc.ar(300);
	//multiply sigby an amp mod sincosc
	mod = SinOsc.ar(1, phase: 0, mul:0.5, add:0.5);
	mod = mod* SinOsc.ar(0.67, phase = 0, mul:0.5, add:0.5);

	sig = sig * mod

	//output sig.
	sig
}.play;
)
a.set(\carrFreq, 600);


//To set an arguments value in an existing Synth,
//reference the synth,
//utilize the '.set()' method
//specify the argument to change and a value
a.set(\carrFreq, 200);
a.set(\carrFreq, 600);
a.set(\carrFreq, 1200);






























