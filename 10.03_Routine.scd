s.boot;

//basic synchronous process
(
{
	"hey Forrest".postln;
	1.0.wait;
	"hey koby".postln;
	1.0.wait;
	"hey eric".postln;
	1.0.wait;
	inf.do({"i was late".postln; 1.wait})
}.fork;
)


//ROUTINE

//create a routine

a = Routine.new( { 1.yield; 2.yield; } )
//step through the routine
a.next.postln;
a.next.postln;
//nothing left to step through
a.next.postln;

(
b = Routine{arg inval;
	inval.postln;
}.value("hello routine");
)


// for 6 seconds, return 200, then continue
(
r = Routine {
        199.yield;
        189.yield;
        200.idle(6);
        199.yield;
        189.yield;
};

fork {
    loop {
        r.value.postln;
        1.wait;
    }
}
);

// the value can also be a stream or a function
(
r = Routine {
        199.yield;
        189.yield;
        Routine { 100.do { |i| i.yield } }.idle(6);
        199.yield;
        189.yield;
};

fork {
    loop {
        r.value.postln;
        1.wait;
    }
}
);