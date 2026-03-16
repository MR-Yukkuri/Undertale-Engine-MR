if (!is_polygon) {
    ds_list_clear(mainboard.listVertex);
    ds_list_add(mainboard.listVertex, [-left, -up], [right, -up], [right, down], [-left, down]);
    mainboard.updateDivide();
} else {
    if (Anim_IsExists(id, "polygon_fraction")) {
        var count = array_length(polygon_vertices_target);
        if (count > 0) {
            ds_list_clear(mainboard.listVertex);
            for (var i = 0; i < count; i++) {
                var start_v = polygon_vertices_start[i];
                var target_v = polygon_vertices_target[i];
                ds_list_add(mainboard.listVertex, [
                    lerp(start_v[0], target_v[0], polygon_fraction),
                    lerp(start_v[1], target_v[1], polygon_fraction)
                ]);
            }
            mainboard.updateDivide();
        }
    } else {
        if (polygon_needs_clean) {
            ds_list_clear(mainboard.listVertex);
            for (var i = 0; i < array_length(polygon_vertices_target); i++) {
                ds_list_add(mainboard.listVertex, polygon_vertices_target[i]);
            }
            mainboard.updateDivide();
            polygon_needs_clean = false;
        }
        
        if (should_revert_to_rectangle) {
            is_polygon = false;
            should_revert_to_rectangle = false;
            ds_list_clear(mainboard.listVertex);
            ds_list_add(mainboard.listVertex, [-left, -up], [right, -up], [right, down], [-left, down]);
            mainboard.updateDivide();
        }
    }
}

mainboard.x = x
mainboard.y = y
mainboard.rot = angle
mainboard.color_frame = color_frame

global.borderCount = ds_list_size(global.borders_list)