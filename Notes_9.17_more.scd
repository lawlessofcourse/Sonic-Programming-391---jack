//More Notes 9.17
/*

Tour of UGens

*/
//To look up documentation, place your cursor on a word and type "cmd + d" or "ctrl + d"
//Look Up "Tour of UGens"



///////////////////////////////////////////////////////////////
// Noise Driven Input freq
(
a = {
	var sig, mod, carrFreq;
	carrFreq = SinOsc.kr(0.2).linlin(-1, 1, 100, 400).poll;
	//initalize sig with the output is SinOsc
	sig = SinOsc.ar(carrFreq);
	//multiply sigby an amp mod sincosc
	//mod = SinOsc.ar(1, phase: 0, mul:0.5, add:0.5);
	//mod = mod * SinOsc.ar(0.67, phase = 0, mul:0.5, add:0.5);

	//sig = sig * mod;

	//output sig.
	sig
}.play;
)
(
a = {
	var sig, mod, carrFreq;
	carrFreq = LFNoise0.kr(0.2).linlin(-1, 1, 100, 400).poll;
	//initalize sig with the output is SinOsc
	sig = SinOsc.ar(carrFreq);
	//multiply sigby an amp mod sincosc
	mod = SinOsc.ar(1, phase: 0, mul:0.5, add:0.5);
	mod = mod * SinOsc.ar(0.67, phase: 0, mul:0.5, add:0.5);

	sig = sig * mod;

	//output sig.
	sig
}.play;
)

(
a = {
	var sig, mod, carrFreq;
	carrFreq = LFNoise0.kr(2);

	carrFreq = carrFreq.linlin(-1, 1, 100, 400).poll;
	//initalize sig with the output is SinOsc
	sig = SinOsc.ar(carrFreq);
	//multiply sigby an amp mod sincosc
	mod = SinOsc.ar(1, phase: 0, mul:0.5, add:0.5);
	mod = mod * SinOsc.ar(0.67, phase: 0, mul:0.5, add:0.5);

	sig = sig * mod;

	//output sig.
	sig
}.play;
)
//////////////////////////////////////////////////////////////////////////////////
// Calling plot on something
(
{
	SinOsc.ar(40) * SinOsc.ar(2)
}.plot(2);
)

(
{
	SinOsc.ar(40 + SinOsc.ar(2).linlin(-1,1,-20,40))
}.plot(2);
)
///////////////////////////////////////////////////////////////////////////////////

// blip example
(
a = {
	arg freq = 200;
	var sig;

	sig = Blip.ar(freq, mul: 0.8);

	sig
};
a.plot(0.1);
a.play;
)

// SAW example
(
a = {
	arg freq = 200;
	var sig;

	sig = Saw.ar(freq, mul: 0.8);

	sig
};
a.plot(0.1);
a.play;
)
// Pulse example
(
a = {
	arg freq = 200;
	var sig;

	sig = Pulse.ar(freq, width: 0.1, mul: 0.8);

	sig
};
a.plot(0.1);
a.play;
)
// Klang
(
a = {
	arg freq = 200;
	var sig;

	sig = Klang.ar(`[ [freq*1, freq*2, freq*4], [0.3, 0.3, 0.3], nil], mul:0.8);

	sig
};
a.plot(0.1);
a.play;
)

(
a = {
	arg freq = 200;
	var sig;

	sig = LFPar.ar(freq, width: 0.1, mul: 0.8);

	sig
};
a.plot(0.1);
a.play;
)

































