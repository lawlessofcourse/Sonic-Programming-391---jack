// Hello World, SC-Style!

//Boot the server
Server.default.boot;

//Empty SynthDef
{}.play;

//Hello World of SC!!
{SinOsc.ar}.play;

//With Variable Frequency
{SinOsc.ar(100)}.play;

//With Explicit Parameter Name
{SinOsc.ar(freq: 200 )}.play;

//Include amp control
{SinOsc.ar(200, 0, 1.0 )}.play;
{SinOsc.ar(freq: 200, mul: 1.0)}.play;
//Line 19 and 20 are same line 19 includes phase def, mul is a multiplier changes amplitude(hearing volume)

//This will be quieter than line 20
{SinOsc.ar(freq: 200, mul:0.5 )}.play;

//g