//Linear Envelopes (or envelopes over time)
({
	var sig, env;

	env = Linen.kr(
		// gate: Line.kr(1,0,0.01);
		 gate: Impulse.kr(1),

		attackTime: 0.01,
		susLevel:0.707,
		releaseTime:0.5
	);
	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//lets look at more codified envelopes

// for all other envelopes, we need a separte UGen and envelope specification
//UGEN --> EnvGen.ar/kr
//Specification comes from the 'Env' class

({
	var sig, env;

	env = Env.perc(
		attackTime:0.1,
		releaseTime: 0.5,
		level: 1.0,
		curve: -4.0,
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//Env.linen is == in many ways to Env.asr
({
	var sig, env;

	env = Env.linen(
		attackTime:0.1,
		sustainTime: 0.5,
		releaseTime: 0.5,
		curve: 0;
	).plot;

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//asr example
({
	var sig, env;

	env = Env.asr(
		attackTime:0.1,
		sustainLevel: 1,
		releaseTime: 0.5,
		curve: 0;
	).plot;

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//ADSR Env
({
	var sig, env;

	env = Env.adsr(
		attackTime:0.01,
		decayTime: 0.5,
		sustainLevel: 0.01,
		releaseTime: 0.5,
		peakLevel: 1,
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//Custom Envs
({
	var sig, env;

	env = Env.new(
		levels: [0,     1,    0.1,    0.8,    0.1,  0.6,     0],
		times: [  0.01,   1,    0.5,     0.5,    2,    0.01],
		curves: [4, -4, 0, 4, -4, 0],
		releaseNode: 1
	);

	env = EnvGen.kr(env, gate: MouseButton.kr(0,1,0), levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(
a = {
	arg gate = 1;
	var sig, env;

	env = Env.new(
		levels: [0,     1,    0.1,    0.8,      0],
		times: [  0.01,    0.5,    0.5,    0.01],
		curve: [4, -4, 0, 4],

	);

	env = EnvGen.kr(env, gate: gate, levelScale:0.707);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)

a.dump

a.free



c = Task({
	d = 0;
	inf.do({
		d = d+1;
		d.postln;
		1.0.wait;
	});
})

c.start
c.pause


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// What happens to a synth after the envelope finsihes?
({
	var sig, env;

	env = Env.linen.kr(
		attackTime: 0.1,
		sustainTime: 0.5,
		releaseTime:0.5,
		curve: 0,

	);

	env =  EnvGen.kr(env, gate: 1, levelScale: 0.5, doneAction: 2);

	sig = SinOsc.ar(400) * env;

	Out.ar(0, sig!2);
}.play;)









































