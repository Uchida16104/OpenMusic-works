use_random_source [:white,:pink,:light_pink,:dark_pink,:perlin].shuffle.choose
def vortex(note,time,release,slide,value)
  calc=hz_to_midi(440*2**((note-69)/12.to_f))
  use_random_seed rrand(0,10).ceil
  with_fx :pitch_shift,pitch:(note-calc).abs,pitch_dis:(note/calc).abs,time_dis:(calc/note).abs,window_size:(calc/note).abs do
    use_random_source [:white,:pink,:light_pink,:dark_pink,:perlin].shuffle.choose
    with_fx :ring_mod, freq:calc do
      use_random_seed rrand(0,10).ceil
      s=play note, release: release, note_slide: slide
      sleep time
      control s, note: note+(range -1*value,value)[calc]
    end
  end
end
def dist(deg)
  use_random_source [:white,:pink,:light_pink,:dark_pink,:perlin].shuffle.choose
  deg.abs.times do
    in_thread do
      use_synth synth_names.shuffle.choose
      use_random_seed rrand(0,10).ceil
      var=rrand(0,2).round(2)
      env=rrand(48,84).round()
      vortex(env,var,var*8,var,deg.abs*12)
    end
  end
end
dist(1)