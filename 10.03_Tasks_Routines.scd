(
Synthdef(\simpleSine, {
	arg freq = 440;
	var sig;

	sig = SinOsc.ar(freq, mul: -3.dbamp);
	Out.ar(0 , sig!2);
}).add;
)

a = Synth(\simpleSine)

(
r = Routine({

	a = Synth(\simpleSine);
	0.1.wait;

	13.do({ arg i;
		a.set(\freq, (i + 60).midicps );
		1.wait;
	})
	a.free;
});
)
r.play;


(
t = Task({

	a = Synth(\simpleSine);
	0.1.wait;

	13.do({ arg i;
		a.set(\freq, (i + 60).midicps );
		1.wait;
	});
	a.free;
});
)

t.play;

t.reset;


////////////////////////////////////////////////////////////////////////////////////////////
(
SynthDef(\ping, {
	arg freq = 400, len = 1, amp = 1;

	var sig, env;

	env = Env.new([0,1,0.3,0.3,0],[0.1,0.01,0.5,0.1]);
	env =  EnvGen.kr(env, timeScale: len,  doneAction: 2);

	sig = SinOsc.ar([freq, freq*1.01], mul: amp ) * env;
	sig = Mix(sig);

	// pos = Rand.new(-1.0, 1.0).poll;

	pos = LFNoise1.kr(Rand.new(0.1, 10)).poll;

	sig = Pan2.ar(sig, pos);

	Out.ar(0, sig!2);
}).add;
)

Synth(\ping);
(
t = Task({
	inf.do({
		var freq, len, amp;
		freq = rrand(200.0, 800.0).postln;
		len = rrand(1.0, 10.0);
		amp = rrand(-24.0, -3).postln;
		"".postln;

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);
		// len.wait;

		// rrand(0.01, len).wait;
		len.wait;
	})
})
)

t.start
t.pause
t.stop

/////////////////////////////////////////////////////////////////////////////////////////////////
(
t = Task({

	inf.do({
		var freq, len, amp;
		freq = rrand(200.0, 800.0);
		len = rrand(0.2, 4.0);
		amp = rrand(-24.0, -3);

		Synth(\ping, [\freq, freq, \len, len, \amp, amp.dbamp]);


		1.0.wait;
	})
})
)

t.start

//leave t running for the following

c = TempoClock.default;

//referecne to default tempoclock
c

c.tempo

c.tempo = 120/60;

c.tempo = 240/60;

c.tempo =  30/60;


















