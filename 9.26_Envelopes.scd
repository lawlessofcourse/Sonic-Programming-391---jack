//data manipulation techniques

//use .linlin method to map from (-1, 1) to (0, 0.1)
({
	var sig;
	sig = SinOsc.ar(0.1).linlin(-1, 1, 0, 0.1);
	Out.ar(5, sig);
}.play;)

// Use the .range method to shortcute the above
({
	var sig;
	sig = SinOsc.ar(0.1).range(0, 10);
	Out.ar(5, sig);
}.play;)

// Clip limits the output range of a signal to the clip values.
({
	var sig;
	sig = SinOsc.ar(0.2, mul: 10);
	sig = sig.clip(1, 2);
	sig.poll;
	Out.ar(5, sig);
}.play;)
////////////////////////////////////////////////////////////////////


// Clock UGens

//impulse is a steady sample generator (steady meaning equal time between impulses)
// Its is "non-bandlimited"
({
	var sig;

	sig = Impulse.ar(MouseX.kr(0,100), mul: 0.7);

	Out.ar(0, sig!2);
}.play;)

//This one's cool
// band-limited impulse generator
({
	var sig;

	sig = Blip.ar(
		MouseX.kr(0,100).poll,
		numharm: MouseY.kr(0, 2000).poll,
		mul:0.7);

	Out.ar(0, sig!2);
}.play;)


// Dust
// dust is an impulse generator that creates X number of impulses per second.
// these are not periodic
({
	var sig;

	sig = Dust.ar(MouseX.kr(0, 1000).poll, mul:0.7);

	Out.ar(0, sig!2);
}.play;)

//Dust2
({
	var sig;

	sig = Dust2.ar(MouseX.kr(0, 1000).poll, mul:0.7);

	Out.ar(0, sig!2);
}.play;)

//LFNoise
//creates low freq noise values
// 0 - step
// 1 - linear ramp
// 2 - exp ramp
({
	var freq, sig;
	// freq = LFNoise0.ar(1).poll;
	// freq = LFNoise1.ar(1).poll;
	freq = LFNoise2.ar(1).poll;

	freq =  freq.range(200, 400).poll;

	sig= SinOsc.ar(freq, mul: 0.7);

	Out.ar(0, sig!2);

}.play;)

























