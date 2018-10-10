// Task

(
t = Task({
    50.do({ arg i;
        i.squared.postln;
        0.5.wait;
    });
});
)

t.start;
t.pause;
t.resume;
t.reset;
t.stop;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
var r, outval;
r = Routine.new({ arg inval;
    ("->inval was " ++ inval).postln;
    inval = 1.yield;
    ("->inval was " ++ inval).postln;
    inval = 2.yield;
    ("->inval was " ++ inval).postln;
    inval = 99.yield;
});

outval = r.next('a');
("<-outval was " ++ outval).postln;
outval = r.next('b');
("<-outval was " ++ outval).postln;
r.reset; "reset".postln;
outval = r.next('c');
("<-outval was " ++ outval).postln;
outval = r.next('d');
("<-outval was " ++ outval).postln;
outval = r.next('e');
("<-outval was " ++ outval).postln;
outval = r.next('f');
("<-outval was " ++ outval).postln;
)
////////////////////////////////////////////////////////////////////////////////////////////////////
(
var r;
r = Routine {
    10.do({ arg a;
        a.postln;
        // Often you might see Wait being used to pause a routine
        // This waits for one second between each number
        1.wait;
    });
    // Wait half second before saying we're done
    0.5.wait;
    "done".postln;
}.play;
)


























