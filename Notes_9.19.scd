/*
September 19th
Additive and Subtractive Synthesis
*/

({
	arg baseFreq = 200;
	var sig1, sig2, sig3, sig4, outSig;

	sig1 = SinOsc.ar( baseFreq, mul: 0.5);
	sig2 = SinOsc.ar( baseFreq * 2, mul: 0.5 );
	sig3 = SinOsc.ar( baseFreq * 3, mul: 0.5 );
	sig4 = SinOsc.ar( baseFreq * 4, mul: 0.5 );


	outSig = Mix([sig1, sig2, sig3, sig4]);

	Out.ar( 0, [outSig, outSig] );
}.play)
(
{
	arg bFreq = 200;
	var n = 10;

	var wave = Mix.fill(4,
	{
		arg i;
			var mult = ((-1)**i)*(0.5/((i+1)
		SinOsc.ar(bFreq*harmonicnumber)/harmonicnumber
	}
	)*0.25;

	Pan2.ar(wave,0.0);

}.scope;
)
// Square Wave
(
{
	arg bFreq = 200;
	var n = 10;

	var wave = Mix.fill(10,
	{
		arg i;
		var harmonicnumber = 2*i+1;
		SinOsc.ar(bFreq*harmonicnumber)/harmonicnumber
	}
	)*0.25;

	Pan2.ar(wave,0.0);

}.scope;
)
// Triangle Wave
(
{
	arg bFreq = 200;
	var n = 2;

	var wave = Mix.fill(10,
	{
		arg i;
		var harmonicnumber = 2*i+1; // odd harmonics only
		var mult = ((-1)**((harmonicnumber-1) / 2)) * (1.0 / (harmonicnumber * harmonicnumber));

		SinOsc.ar(bFreq*i) * mult;
	}
	)/n;

	Pan2.ar(wave,0.0);

}.scope;
)


////////////////////////////////////////////////////////////////////////////////////
//RECAP
// using Out.ar to play out of both speakers using var ! 2 or an array of var's
({
	var sig;

	sig = SinOsc(200, mul: 0.5);

	//sig = sig ! 2; or
	sig = [sig, sig];

	Out.ar(0, sig);
}.play;)
//////////////////////////////////////////////////////////////////////////////////