function draw_sprite_outline(sprite,index,x,y,xscale=1,yscale=1,outline_size=1,angle=0,outline_color=c_black,color=c_white,alpha=1){
    for (var i=-outline_size; i<=outline_size; i++) {
        for (var j=-outline_size; j<=outline_size; j++) {
            if (i != 0 || j != 0) { 
                draw_sprite_ext(sprite, index,
                    x + i * xscale,
                    y + j * yscale,
                    xscale, yscale, angle,
                    outline_color, alpha
                );
            }
        }
    }
    draw_sprite_ext(sprite,index,x,y,xscale,yscale,angle,color,alpha);
}
