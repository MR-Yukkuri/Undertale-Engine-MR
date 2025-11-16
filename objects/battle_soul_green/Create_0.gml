// Inherit the parent event
event_inherited();

image_blend = make_color_rgb(0,192,0)
moveable = 1
shield_amount = 2
dir = array_create(shield_amount,0)
s_dir = array_create(shield_amount,0)
s_hit = array_create(shield_amount,0)
input = [
	[vk_up,vk_down,vk_left,vk_right],
	[ord("W"),ord("S"),ord("A"),ord("D")]
]
shield_color = [
	[make_colour_rgb(65,65,255),c_red],
	[c_red,make_colour_rgb(65,65,255)]
]