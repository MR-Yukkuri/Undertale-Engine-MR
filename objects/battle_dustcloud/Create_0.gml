scale = random(1) + 0.7;
image_xscale = scale;
image_yscale = scale;
image_speed = 0.25;
speed = 4;
Anim_Create(id,"speed",0,0,speed,-speed,20);
Anim_Create(id,"image_alpha",0,0,image_alpha,-image_alpha,50);