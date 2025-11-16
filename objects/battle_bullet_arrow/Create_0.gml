event_inherited()
depth = DEPTH_BATTLE.BULLET_OUTSIDE_LOW
out = true
damage = 3
hit_destroy = true
can_prevent = true
assist = true
distance = point_distance(x,y,battle_soul.x,battle_soul.y)
c_dis = distance/2
is_c = false
mode = 0
follow_soul = true
spd = 4
cx = 0
cy = 0
spr = [spr_arrow_blue,spr_arrow_red]
spr_yellow = [spr_arrow_yellow_blue,spr_arrow_yellow_red]
mix_spr = ds_map_create()
mix_spr[?"0,1"] = [spr_arrow_purple,spr_arrow_yellow_purple]

auto_mix = false