#This is ruby file for live electronics, and please run it by Sonic PI.
#http://sonic-pi.net/
live_loop :foo do
  with_fx :reverb do
    with_fx :echo do
      with_fx :gverb do
        with_fx :ping_pong do
          with_fx :ring_mod do
            live_audio :voice
          end
        end
      end
    end
  end
  sleep 8
end
