//NOTES 9/5
//SUPERCOLLIDER IS MADE UP OF Synthesizer, Audio Engine, and IDE (Integrated Devolopment Enviroment.
//Data Types: 1)Float(0.77878) 2)Int(whole single number 1) 3)Boolean(true false) 4)Char(any single character/number/special) 5)String "Hello World"

"Hello World".postln;"Hey ehlalsofajsdofahsf".postln;"I like cats".postln;//post line posts line to post window
//executes by line, to execute all together highlight all and shift enter.
"Jack Lawless".postln;
//paranthesis create code block ex. use cntrl enter to execute block.
("Jack Lawless".postln;
"Media Arts Montana".postln;
"Sonic Programming".postln;)
//Always save as .scd

//Hello World using Sine Wave
{}.play; //Plays whatever in block/excecuted
{SinOsc.ar}.play;//.ar is audio rate.

//Hello World with Input Arguments
({SinOsc.ar(200)}.play;
{SinOsc.ar(400)}.play;
{SinOsc.ar(800)}.play;)

//Sine Wave with freq--> 200Hz
//mul(multiplier) is amplitude / distorts the sine wave amplitude
//'mul' is a multiplier to the output signal and is auto set to 1
//alsmost all ugens (unit generators) and processing units have a mul argument optional
{SinOsc.ar( freq: 200, mul: 0.5 )}.play;
//this is the same as writing
{SinOsc.ar(freq: 200) * 0.5 }.play;

//Sine wave amp mult by sine wave with freq of 0.5
{SinOsc.ar(freq: 200) * SinOsc.kr(0.5).poll }.play;
{MouseX.kr.poll}.play; //poll posts values as a list in post window as time goes by
{SinOsc.ar(freq: 200) * MouseX.kr(0,1).poll }.play;

{SinOsc.ar(freq: 200) * SinOsc.kr(20)).poll }.play;
//Use MouseX UGen to drive the frewuencey of a sine wave
{SinOsc.ar(freq: MouseX.kr(20, 3000))}.play;
//Use Mouse X/Y to create a pseudo-theramin
{SinOsc.ar(freq: MouseX.kr(20, 2000), mul:MouseY.kr(0,1) )}.play;

//Use ampluttude modulation to create complex wave forms
{SinOsc.ar(freq: MouseX.kr(20, 2000)) * SinOsc.kr(MouseY.kr(0, 100)) }.play;4

{SinOsc.ar(freq: MouseX.kr(20, 2000)) * SinOsc.kr(MouseY.kr(0, 100)).pollg }.play;



//.kr IS CONTROL RATE .ar IS AUDIO RATEG


















