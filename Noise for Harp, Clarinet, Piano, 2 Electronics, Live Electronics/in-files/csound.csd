<CsoundSynthesizer>
<CsOptions>
-o dac // real-time output
</CsOptions>
<CsInstruments>
sr = 44100 // sample rate
0dbfs = 1 // maximum amplitude (0 dB) is 1
nchnls = 2 // number of channels is 2 (stereo)
ksmps = 64 // number of samples in one control cycle (audio vector)
instr 1
  krnd random 1,2
  iAmp = p4
  iFreq = p5
  aOut = vco2:a(iAmp*krnd,iFreq*krnd)
  outall(aOut)
endin
</CsInstruments>
<CsScore>
krnd random 0,100
i 1 0 1 0.1 220*krnd
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
