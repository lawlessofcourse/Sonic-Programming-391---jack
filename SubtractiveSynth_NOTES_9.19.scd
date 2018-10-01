/*
September 19thn notes cont'd
Subtractive Synthesis

*/

//white noise
({
	var sig;


/*	sig = PinkNoise.ar(0.707); // Generates noise whose spectrum falls off in power by 3 dB per octave, which gives equal power over the span of each octave. This version is band-limited to 8 octaves.*/

	/*sig = BrownNoise.ar(0.707);//Generates noise whose spectrum falls off in power by 6 dB per octave.*/

	// sig = ClipNoise.ar(0.707);//Generates noise whose values are either -1 or 1. This produces the maximum energy for the least peak to peak amplitude.

	sig = WhiteNoise.ar(0.707);//Generates noise whose spectrum has equal power at all frequencies.

	// sig = GrayNoise.ar(0.707); //Generates noise which results from flipping random bits in a word. This type of noise has a high RMS level relative to its peak to peak level. The spectrum is emphasized towards lower frequencies.

	sig = Dust.ar(3, 0.7);//Dust creates noise impulses


}.play;)

//Basic low pass filter
({
	var sig;
	sig =  WhiteNoise.ar(MouseY.kr(0, 0.707));
	sig = LPF.ar( sig, freq: MouseX.kr(100, 20000) );
}.play;)

// Resonant Low Pass Filter
//Notice how low 'w' creates a more distinguished resonat freq!
({
	var sig;
	sig =  BrownNoise.ar(MouseY.kr(0, 0.707));
	sig = RLPF.ar( sig, freq: MouseX.kr(100, 18000).poll(label: \freq), rq: MouseY.kr(0.001, 0.99).poll(label: \rq));
}.play;)

//
({
	var sig;
	sig =  PinkNoise.ar(MouseY.kr(0, 0.707));
	sig = Resonz.ar( sig, freq: MouseX.kr(100, 10000).poll(label: \freq), bwr: MouseY.kr(0.001, 10).poll(label: \bwr));
}.play;)


//CAREFUL
({
	var sig;
	sig =  WhiteNoise.ar(MouseY.kr(0, 0.05));
	sig = Ringz.ar( sig, freq: MouseX.kr(100, 10000).poll(label: \freq), bwr: MouseY.kr(0.000001, 1).poll(label: \decayTime));
}.play;)

//Pass in LFNoise as source
//CAREFUL
({
	var sig;

	sig =  LFNoise0.ar(1000, mul:0.7);
	sig = Resonz.ar( sig, freq: MouseX.kr(100, 10000).poll(label: \freq), bwr: MouseY.kr(0.001, 4).poll(label: \bwr));
}.play;)

//

























