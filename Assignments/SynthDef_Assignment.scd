(
SynthDef(\inputMod,{
	arg freq = 450, delayT = 0.5, decayT = 0.5;
	var in, sig, mod, mod2, mod3, env;

	in = SoundIn.ar(0, 1.0);

	env = Env.new(
		[2, 2,   0.5, 0.5, 1, 1,   5, 5, 0.75, 0.75 ],
		[  1, 0.5,   5,   3, 2, 0.5, 2, 1,    10  ],
	);
	env = EnvGen.kr(env, timeScale: 1);



	mod = SinOsc.ar(LFNoise1.kr(5, 400, 300) + in , mul: 0.707) * LFTri( in-200, mul:0.7);
	mod2 = SinOsc.ar(Vibrato.ar(DC.ar(400.0),LFNoise1.kr(1,3,7),rrand(0.0, 1.0),1.0,1.0,rrand(0.0, 1.0),0.1) );
	mod3 = LFTri.ar(Vibrato.kr(200.0, 6.0, 0.5));

sig = CombC.ar(
		in,
		maxdelaytime: 10,
		delaytime: 0.5,
		decaytime: 1,
		mul: 0.707
	) * mod;


	sig = Limiter.ar( sig, 0.9 );

	sig = Mix(sig);

	Out.ar(0, sig ! 2 );

}).add;
)

Synth(\inputMod)
//////////////////////////////////////////////////////////////////////////
(
SynthDef(\higher, {
	arg freq = 400, depth = 0.05;
	var sig, sig2, sig3, env;

	sig = SinOsc.ar(Vibrato.kr(freq,1,depth));
	sig2= LFSaw.ar(Vibrato.kr(freq/2, 1,depth/2));
	sig2 = DelayC.ar(sig, maxdelaytime: 10, delaytime: 1, mul: 1);
	sig = DelayC.ar(in: sig, maxdelaytime: 10, delaytime: 1, mul:1);
	sig3 = Mix.new([sig, sig2]);
	Out.ar(0, sig3!2);
}).add;
)
Synth(\higher)
{ Mix.new([ PinkNoise.ar(0.1), FSinOsc.ar(801, 0.1), LFSaw.ar(40, 0.1)]) }.play
(
v = Task({

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(
SynthDef(\bassNoise, {
	arg freq = 50, amp = 1, len = 1;
	var sig, sig2, masterSig, env;

	env = Env.new(
		[0, 0,     2,    2,    0, 0,    2,    2,    0, 0,    2, 2, 0],
		[  0, 0.25,  0.5,  0.25, 0.5, 0.25, 0.5,  0.25, 0.5, 0.25, 2, 0.25 ]*0.2);
	env = EnvGen.kr(env, timeScale: 1);


	sig = RLPF.ar(Saw.ar(freq, mul: amp), 450)*env;
	sig = CombC.ar(sig, 1, 0.15, 1);



	Out.ar(0, sig!2);
}).add;
)

Synth(\bassNoise)



(
t = Task({

	inf.do({
		var freq, len, amp;
		freq = rrand(200.0, 800.0).postln;
		len = rrand(1.0, 10.0).postln;
		amp = rrand(-24.0, -3.0).postln;
		"".postln;

		Synth(\bassNoise,);

		1.5.wait;
		// len.wait;
	})
})
)
t.play;
t.stop;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(
SynthDef(\inputMod2,{
	arg freq = 150, rate = 2, amp2 = 1;
	var  sig;

	sig = LFTri.ar(Vibrato.kr(freq: freq, rate: rate, depth: 0.5, delay: 0.2), mul: amp2);
	sig = CombC.ar(sig, 10, 0.2, 1);

	Out.ar(0, sig!2);



}).add;
)

a = Synth(\inputMod2)

a.free;

(
t = Task({
	a = Synth(\inputMod2);
	0.1.wait;

	1.do({ arg i;
		a.set(\rate, (i + 0.25) );
		a.set(\amp, (i - 0.1));

		1.wait;
	});
	// a.free;
});
)
t.start
t.stop
(
h = Task({
	inf.do({
		var freq1,
		freq1 = rrand(20, 200);

		Synth(\inputMod2, [\freq, freq1]);
	1.0.wait;
	})
})
)

h.start