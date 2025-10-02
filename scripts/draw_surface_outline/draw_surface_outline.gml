function draw_surface_outline(surface, x, y, outline_color=c_black, outline_size=1, alpha=1) {
    for (var i=-outline_size; i<=outline_size; i++) {
        for (var j=-outline_size; j<=outline_size; j++) {
            if (i != 0 || j != 0) {
                draw_surface_ext(surface, x + i, y + j, 1, 1, 0, outline_color, alpha);
            }
        }
    }
    draw_surface_ext(surface, x, y, 1, 1, 0, c_white, alpha);
}
