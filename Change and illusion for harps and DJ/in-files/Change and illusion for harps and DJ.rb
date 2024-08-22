define :foo do
  with_fx :reverb,room:1 do
    with_fx :flanger,wave:choose([0,1,2,3,4]),invert_flange:choose([0,1]),stereo_invert_wave:choose([0,1]),invert_flange:choose([0,1]) do
      7.times do
        sample :bass_hit_c,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(1)
        sleep 0.25
        sample :drum_cymbal_closed,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(1)
        sleep 0.25
      end
      2.times do
        sample :bass_hit_c,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(1)
        sleep 0.25
      end
    end
  end
  # 4seconds
end
define :arp do
  with_fx :gverb,mix:0.5,room:1 do
    with_fx :ixi_techno,mix:0.5,wave:choose([0,1,2,3,4]),invert_flange:choose([0,1]),stereo_invert_wave:choose([0,1]),invert_flange:choose([0,1]) do
      4.times do
        sample :drum_cymbal_closed,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(-1)
        sleep 0.125
      end
      sample :sn_dub,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(-1)
      sleep 0.125
      2.times do
        sample :drum_cymbal_closed,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(-1)
        sleep 0.125
      end
      sample :sn_dub,amp:rrand(1,2),mix:rrand(0,1),pan:rdist(-1)
      sleep 0.125
    end
  end
  # 1second
end
in_thread do
  use_random_seed 2
  w=choose([6,7])
  w.times do
    if dice(6) > 3
      arp
      sleep rrand(30,40)
      if dice(6) <= 3
        foo
        sleep rrand(30,35)
      end
    end
  end
end
in_thread do
  14.times do
    with_fx :reverb do
      s = sample :ambi_dark_woosh,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5),rate:rdist(-1),finish:rrand(0,1)
      sleep rrand(8,12)
      control s,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5)
    end
  end
end
in_thread do
  15.times do
    with_fx :reverb do
      t = sample :perc_bell2,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5),rate:rdist(1),finish:rrand(0,1)
      sleep rrand(7,11)
      control t,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5)
    end
  end
end
in_thread do
  13.times do
    with_fx choose([:reverb,:gverb]) do
      with_fx choose([:echo,:ping_pong]) do
        u = sample :sn_generic,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:0.2781179138321995*rrand(1,3),rate:rdist(-1),finish:rrand(0,1)
        sleep rrand(9,13)
        control u,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5)
      end
    end
  end
end
in_thread do
  16.times do
    with_fx :reverb do
      v = sample :ambi_glass_hum,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(1,3),rate:rdist(1),finish:rrand(0,1)
      sleep rrand(6,10)
      control v,amp:rrand(1,5),mix:rrand(0,1),pan:rrand(-1,1),beat_stretch:rrand(3,5)
    end
  end
end
in_thread do
  p=choose([8,9])
  p.times do
    x=rrand(10,15)
    y=synth :dark_ambience,note:choose([60,61,62,63,64,65,66,67,68,69,70,71])+choose([0,0.25,0.5,0.75]),note_slide:1,amp:rrand(0.1,3),sustain:x*4,mix:rrand(0,1),pan:rrand(-1,1),finish:rrand(0,1)
    sleep x
    control y,note:choose([60,61,62,63,64,65,66,67,68,69,70,71])+choose([0,0.25,0.5,0.75]),amp:rrand(0.1,3),mix:rrand(0,1),pan:rrand(-1,1)
  end
end
in_thread do
  10.times do
    q=rrand(11,16)
    r=synth choose([:bnoise,:cnoise,:gnoise,:noise,:pnoise]),note:choose([36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83])+choose([0,0.25,0.5,0.75]),note_slide:1,amp:rrand(0.1,0.5),mix:rrand(0,1),pan:rrand(-1,1),finish:rrand(0,1)
    sleep q
    control r,note:choose([36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83])+choose([0,0.25,0.5,0.75]),amp:rrand(0.1,0.5),mix:rrand(0,1),pan:rrand(-1,1)
  end
end