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

//SynthDef Exploring Control Rate
{MouseX.kr().poll}.play;

//Use a control Rate UGen to Modulate Amplitude of a Sine Osc
{SinOsc.ar(freq: 200, mul: MouseX.kr)}.play;

//Applied to the output of the SinOsc
{SinOsc.ar(freq: 200,)*MouseX.kr}.play;

//Applied to the freq   of the SinOsc
{SinOsc.ar(freq:(400  *MouseX.kr, mul: 0.707)}.play;




