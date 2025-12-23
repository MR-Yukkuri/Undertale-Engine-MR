// Inherit the parent event
event_inherited();

audio_stop_sound(snd_gb_charge)
audio_play_sound(snd_gb_charge,0,0)

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH
out = true
pause = 20
duration = 35
movetime = 40
time = 0
beam = noone
beam_alpha = 0
beam_yscale = 0
beam_scale = 0
collision_scale = 0.8
image_speed = 0
is_out = false