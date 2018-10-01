// Envelopes Revisited

//Note
({
	var sig, noteEnv;

	noteEnv = Env.new(
		[60, 60, 0, 0, 60, 60, 0, 0, 67, 67, 0, 0, 67, 67, 0, 0],
		[  3,   0.25, 1, 0.25,  3,  0.25, 1, 0.25,  3, 0,  1, 0,  3,  0, 1 ]*0.2
	);

	noteEnv = EnvGen.kr( noteEnv ).poll;

	sig = SinOsc.ar( noteEnv.midicps, mul: 0.7);

	Out.ar( 0,sig!2 );
}.play;)

(
a = {
	arg gateVal = 1;
	var sig, env;

	env = Env.new(
		[0,    1,    0.3,     0.7,     0],
		[  0.3,  0.01,    0.5,     2   ],
		curve: [4, -4, 4, -4],
		releaseNode: 2,
	);
	env =  EnvGen.kr( env, gate: gateVal.poll).poll;

	sig = LFTri.ar( 60.midicps, mul: env * 0.7 );

	Out.ar(0, sig!2);


}.play;)

a.set(\gateVal, 0)

({
	var in, sig, dT;

	in = SoundIn.ar(0);

	sig = CombC.ar(
		in,
		maxdelaytime: 10,
		delaytime: MouseX.kr(0, 10).lag(4).poll,
		decaytime: MouseY.kr(0, 1000).poll
	) + in;

	sig = Limiter.ar( sig, 0.9 );

	Out.ar(0, sig!2);

}.play;)






































