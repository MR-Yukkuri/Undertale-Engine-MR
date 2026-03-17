if(Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP)<=0){
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X,x-camera.x);
	Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y,y-camera.y);
	room_goto(room_gameover);
}
var STATE=Battle_GetState();
if(STATE==BATTLE_STATE.TURN_PREPARATION||STATE==BATTLE_STATE.IN_TURN){
    var w = sprite_width / 2;
    var h = sprite_height / 2;

    repeat(5) {
        var check_points = [
            [x, y - h],       // Top
            [x, y + h],       // Bottom
            [x - w, y],       // Left
            [x + w, y],       // Right
            [x - w * 0.5, y - h * 0.8], // Top-Left-ish
            [x + w * 0.5, y - h * 0.8], // Top-Right-ish
            [x - w * 0.7, y + h * 0.5], // Bottom-Left-ish
            [x + w * 0.7, y + h * 0.5]  // Bottom-Right-ish
        ];
        for (var j = 0; j < 8; j++) {
            var px = check_points[j][0];
            var py = check_points[j][1];
            
            var inside_any = false;
            for (var i = 0; i < global.borderCount; i++) {
                var bb = global.borders_list[| i];
                if (instance_exists(bb) && bb.contains(px, py)) {
                    inside_any = true;
                    break;
                }
            }
            
            if (!inside_any) {
                var nearest_bb = noone;
                var min_dist = -1;
                var target_pos = [px, py];
                
                for (var i = 0; i < global.borderCount; i++) {
                    var bb = global.borders_list[| i];
                    if (instance_exists(bb)) {
                        var pos = bb.limit(px, py);
                        var dist = point_distance(px, py, pos[0], pos[1]);
                        if (nearest_bb == noone || dist < min_dist) {
                            min_dist = dist;
                            nearest_bb = bb;
                            target_pos = pos;
                        }
                    }
                }
                
                if (nearest_bb != noone) {
                    var ox = target_pos[0] - px;
                    var oy = target_pos[1] - py;
                    x += ox;
                    y += oy;
                    for (var k = j + 1; k < 8; k++) {
                        check_points[k][0] += ox;
                        check_points[k][1] += oy;
                    }
                }
            }
        }
    }
}
