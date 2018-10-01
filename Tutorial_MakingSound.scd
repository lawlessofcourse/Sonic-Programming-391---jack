x = {SinOsc.ar(700, 0, 0.125, 0)}.play;

x.free;
(
z  = {
	arg freq=440, amp=1;
	var sig;
	sig = SinOsc.ar(freq)*amp;
}.play;
)

z.set(\freq, 330);
z.set(\amp, 0.125);
z.set(\freq, 660, \amp, 1);
z.set(\amp, 0.125, \freq, 550);
z.free;
//

//Using Ugens to control other Ugens
(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8, 400, 600);
	sig = SinOsc.ar(freq);
}.play;
)

z.free;
//Same as above just using the range method
(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8).range(200,1000);
	sig = SinOsc.ar(freq);
}.play;
)

z.free;
//exprange is a more equal range method

//Changing variables to mod the sound and adding arguments
(
z = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	amp = LFNoise1.kr(12).exprange(0.02,1);
	sig = SinOsc.ar(freq) * amp;
}.play;
)
//exprand generates random numbers between given inputs
z.set(\noiseHz, exprand(4,64));
z.free;

