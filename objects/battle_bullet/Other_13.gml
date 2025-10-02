///@desc Break
Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,10)
Anim_Destroy(id,"hspeed")
Anim_Destroy(id,"vspeed")
Anim_Destroy(id,"follow_hspeed")
Anim_Destroy(id,"follow_vspeed")
hit = false
can_break = false
hspeed = 0
vspeed = 0
follow_hspeed = 0
follow_vspeed = 0
rotate = 0
alarm[0] = 10
