// SynthDef & Synths

//shortcut method
({}.play;)

//SYNTHDEF
/*
A SynthDef is a template for creating a synth node.
These are used by ScServer.
A Synth node is what SCServer uses to catually make sound.

We want to start explicitly defining Synth Definitions and launching Synth Nodes from those definitions

This allows us:
- The ability to pass references of nodes to other nodes
- Control the initialization and removal of individual nodes
- More asily control arguments in running nodes
*/

//////////////////////////////////////////////////////////////////////
// To define a SynthDef, use SynthDef()
(
SynthDef(\testSynth, {
		var sig;
		sig = SinOsc.ar(200);
		Out.ar(0, sig!2)
	}).add
);

// To play synth def
Synth(\testSynth);
//////////////////////////////////////////////////////////////////////
(
SynthDef(\whatever, {
	arg freq = 200, mul = 0.7;
	var sig;

	sig = SinOsc.ar(freq, mul: mul);

	//We must explicitly include an Out Ugen
	Out.ar(0, sig!2);

}).add;
);

//create multiple instances with differenct arguments
Synth(\whatever);
Synth(\whatever, args: [\freq, 400, \mul, 0.5]);

//alter running synth node
a = Synth(\whatever)
a.set(\freq, 400)
a.set(\mul, 0.1)
a.set(\freq, 1000, \mul, 0.05)

//to get argument values
a.getMsg(\freq)
a.get(\freq, {arg value; ("freq is now:" + value + "Hz").postln;});

a.free;
//////////////////////////////////////////////////////////////////////
//RECORDING




(
SynthDef(\yep, {
	var sig;
}).add;
)








