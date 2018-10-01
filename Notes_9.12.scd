//NOTES September 12th
//freq modulation altering the freq of synthesis process
//amplitude modulation
{SinOsc.ar(freq: MouseX.kr(20, 600)) * SinOsc.kr(freq: MouseY.kr(100, 800)).poll}.play;

//Sine wave that has amplitude modulation from another sin wave
//Amplitude mod example 1
(
{
	SinOsc.ar(MouseX.kr(80, 320)) *
	SinOsc.ar(MouseY.kr(0.01, 400).poll, mul: 0.5, add: 0.5);
}.play;
)

//Frequency Modulation (FM) Example 1
(
{
	// a carrier frequency is multiplied by a modulation frequency
	SinOsc.ar( SinOsc.ar(200, mul: 50, add: 50)) + (SinOsc.ar(MouseX.kr(0,100).poll, mul: 0.5) * SinOsc.ar(40, mul: 50));
}.play;
)

//Too-Much Modulation Example
(
{
	// a carrier frequency is multiplied by a modulation frequency
	SinOsc.ar(
		freq: SinOsc.ar(200, mul: 50, add: 50) +
	    (
		  SinOsc.ar(
			freq: MouseX.kr(0,100).poll,
			mul: 0.5
			) * SinOsc.ar(40, mul: 50)
		)
	);
}.play;
)

//Using Variables to control signal flow
(
{
	var carr, mod, outputSig;

	carr = SinOsc.ar(400);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr + mod;
}.play
)

//Using Arguements for single pieces of data
(
{
	arg carrFreq = 400;
	var carr, mod, outputSig;

	carr = SinOsc.ar(400);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr + mod;
}.play
)
// in SC a-z are set aside as global "enviroment variables
c = 300;
c // Excecute this line to get back the value in c

// define your own global enviroment variable with '~'
~myVar = "Michael Musick is tired";
~myVar

d = /thisIsASymbol
d.dump


//Using Arguements to change existing processes
(
{
	arg carrFreq = 400;
	var carr, mod, outputSig;

	carr = SinOsc.ar(400);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr + mod;
}.play
)

a.set(/carrFreq, 100)


//Using env variable to store a synth instance
(
a={
	arg carrFreq = 400;
	var carr, mod, outputSig;

	carr = SinOsc.ar(carrFreq);
	mod = SinOsc.ar(100, mul: 0.5, add: 0.5);

	outputSig = carr + mod;
}.play
)

//change arguments of an active synth instance
a.set(/carrFreq, 1000)

a.dump

(
{
	var sig;
	sig = SinOsc.ar(300);

	//multi-channel expansion (the easy way)
	sig ! 2; //duplicate signal twice
}.play;
)

(
{
	var sig;
	sig = SinOsc.ar(300);

	//multi-channel array with two channels
	[sig, sig]; //duplicate signal twice assign to left and right channel
}.play;

)

//sep left/right
(
{
	var left, right;

	left = SinOsc.ar(200);

	right = Saw.ar(210, mul: 0.707);

	//Out.ar(0, [left, right]);
	Out.ar(0, [right]);
	Out.ar(1, [left]);
}.play;
)

//correct way of handling panning
(
{
	var sig;
	sig = Saw.ar(210, mul: 0.707);
	sig = Pan.kr
}.play;
)

























