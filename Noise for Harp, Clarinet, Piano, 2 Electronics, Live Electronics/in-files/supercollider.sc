var fx, sig;
sig = In.ar(~rvbBus, 2);
fx = FreeVerb2.ar(sig, 1, 1, 0);
fx = CombL.ar(sig, 1, 0.125, 0.125, 2, 1);
fx = AllpassN.ar(sig, 0.125, 0.125, 0.125, 2, 1);
fx = DelayC.ar(sig, 0.125, 0.125, 2, 1);
play {
	var env = Env.linen(rrand(0,1,1),rrand(0,1,1),rrand(0,1,1),rrand(0,1,1));
	Klang.ar(`[
		rand(800, 1000, 1200) + VarSaw.kr(rand(2, 3, 4.2), LFPulse.ar(rrand(220,4,2),rrand(0,1,1),1,0),
			SinOsc.kr(rand(13, 24, 12))),
		[rrand(0,1,1), rrand(0,1,1), rrand(0,1,1)],
		[rrand(-0.25pi,2pi,1),rrand(-0.25pi,2pi,1),rrand(-0.25pi,2pi,1)]
	]
	) * rrand(0,1,1) * EnvGen.kr(env, doneAction: Done.freeSelf, timeScale: rrand(0,1,1))
}.fx;