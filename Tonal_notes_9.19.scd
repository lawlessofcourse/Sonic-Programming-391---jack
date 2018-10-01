//Tonal Sounds

({
	var sig, note, freq;

	note = MouseX.kr(50, 100, warp: 0);
	note = note.floor.poll;
	freq = note.midicps;
	(note%12).poll;

	SinOsc.ar(freq, mul: 0.707);

}.play;
)