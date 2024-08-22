dist="/path/to/Noise/in-files/"
pi=Math::PI.round
pipowe=pi.pow(Math::E).round
use_random_seed pipowe
pipowe.round.times do
  chance=rrand(0,3).round
  if chance%3==0
    with_fx fx_names.choose, amp:rrand(0,1), mix:rrand(0,1) do
      sample dist+"csound.wav"
      sleep sample_duration(dist+"csound.wav")
    end
  elsif chance%3==1
    with_fx fx_names.choose, amp:rrand(0,1), mix:rrand(0,1) do
      sample dist+"puredata.wav"
      sleep sample_duration(dist+"puredata.wav")
    end
  elsif chance%3==2
    with_fx fx_names.choose, amp:rrand(0,1), mix:rrand(0,1) do
      sample dist+"supercollider.wav"
      sleep sample_duration(dist+"supercollider.wav")
    end
  end
end
