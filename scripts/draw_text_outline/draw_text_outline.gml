function draw_text_outline(x, y, text, outline_color=c_black, color=c_white, xscale=1, yscale=1, outline_scale=1, angle=0, alpha=1) {
    draw_set_alpha(alpha);
    draw_set_color(outline_color);
    for (var i=-outline_scale; i<=outline_scale; i++) {
        for (var j=-outline_scale; j<=outline_scale; j++) {
            if (i != 0 || j != 0) {
                draw_text_transformed(
                    x + i,
                    y + j,
                    text, xscale, yscale, angle
                );
            }
        }
    }
    draw_set_color(color);
    draw_text_transformed(x, y, text, xscale, yscale, angle);

    draw_set_alpha(1);
}
