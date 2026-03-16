///@arg sides_or_circle
///@arg time*
///@arg tween*
///@arg ease*
///@arg up*
///@arg down*
///@arg left*
///@arg right*
function Battle_SetBoardPolygon(input) {
    if (!instance_exists(battle_board)) return;
    var board = battle_board;
    var time = (argument_count > 1) ? argument[1] : 0;
    var tween = (argument_count > 2) ? argument[2] : 0;
    var ease = (argument_count > 3) ? argument[3] : 0;
    var U = (argument_count > 4) ? argument[4] : board.up;
    var D = (argument_count > 5) ? argument[5] : board.down;
    var L = (argument_count > 6) ? argument[6] : board.left;
    var R = (argument_count > 7) ? argument[7] : board.right;
    //var revert = (argument_count > 8) ? argument[8] : false;

    var sides = 0;
    var is_circle = false;
    if (is_string(input) && input == "circle") {
        sides = 64;
        is_circle = true;
    }
    else if (is_real(input)) {
        sides = max(3, floor(input));
        is_circle = (sides >= 64);
    }

    var target_vertices = [];
    if (sides > 0) {
        for (var i = 0; i < sides; i++) {
            var angle = (i / sides) * 360 - 90;
            var dx = dcos(angle), dy = dsin(angle);
            var rx = (dx > 0) ? R : L, ry = (dy > 0) ? D : U;
            target_vertices[i] = [dx * rx, dy * ry];
        }
    }
    _Battle_SetBoardPolygonCore(target_vertices, time, tween, ease, false, is_circle);
}

function Battle_SetBoardPolygonCustom(vertices,time=0,tween=0,ease=0) {
    _Battle_SetBoardPolygonCore(vertices, time, tween, ease, false, false);
}

function _Battle_SetBoardPolygonCore(target_raw, time, tween, ease, revert) {
    if (!instance_exists(battle_board) || !instance_exists(battle_board.mainboard)) return;
    var board = battle_board;
    if (array_length(target_raw) == 0) return;

    var is_target_circle = (argument_count > 5) ? argument[5] : false;

    var start_raw = [];
    var is_start_circle = false;
    if (!board.is_polygon) {
        start_raw = [[-board.left, -board.up], [board.right, -board.up], [board.right, board.down], [-board.left, board.down]];
        is_start_circle = false;
    } else {
        is_start_circle = (variable_instance_exists(board, "polygon_is_circle") ? board.polygon_is_circle : false);
        if (Anim_IsExists(board, "polygon_fraction")) {
            var list = board.mainboard.listVertex;
            for (var i = 0; i < ds_list_size(list); i++) start_raw[i] = list[| i];
        } else {
            start_raw = (array_length(board.polygon_vertices_clean) > 0) ? board.polygon_vertices_clean : [[-board.left, -board.up], [board.right, -board.up], [board.right, board.down], [-board.left, board.down]];
        }
    }

    var sample_poly = function(_poly, _count, _is_circle) {
        var _len = array_length(_poly);
        var _res = array_create(_count);
        
        var _total = 0, _dists = array_create(_len);
        for(var i=0; i<_len; i++) {
            _dists[i] = point_distance(_poly[i][0], _poly[i][1], _poly[(i+1)%_len][0], _poly[(i+1)%_len][1]);
            _total += _dists[i];
        }
        
        if (_total <= 0) { for(var i=0; i<_count; i++) _res[i] = _poly[0]; return _res; }

        for(var i=0; i<_count; i++) {
            var _p = (i / _count) * _total;
            var _curr = 0;
            for(var j=0; j<_len; j++) {
                if (_curr + _dists[j] >= _p - 0.0001 || j == _len - 1) {
                    var _f = (_dists[j] > 0) ? (_p - _curr) / _dists[j] : 0;
                    _res[i] = [lerp(_poly[j][0], _poly[(j+1)%_len][0], _f), lerp(_poly[j][1], _poly[(j+1)%_len][1], _f)];
                    break;
                }
                _curr += _dists[j];
            }
        }
        
        if (!_is_circle) {
            for(var i=0; i<_len; i++) {
                var _v = _poly[i];
                var _min_d = -1, _min_idx = 0;
                for(var j=0; j<_count; j++) {
                    var _d = point_distance(_v[0], _v[1], _res[j][0], _res[j][1]);
                    if (_min_d == -1 || _d < _min_d) { _min_d = _d; _min_idx = j; }
                }
                _res[_min_idx] = [_v[0], _v[1]];
            }
        }
        return _res;
    };

    var samples = 64;
    var final_start = sample_poly(start_raw, samples, is_start_circle);
    var final_target = sample_poly(target_raw, samples, is_target_circle);

    var _best_offset = 0, _min_total_d = -1;
    for(var _o = 0; _o < samples; _o++) {
        var _total_d = 0;
        for(var _k = 0; _k < 4; _k++) {
            var _idx = (_k * samples) div 4;
            _total_d += point_distance(final_start[_idx][0], final_start[_idx][1], final_target[(_idx + _o) % samples][0], final_target[(_idx + _o) % samples][1]);
        }
        if (_min_total_d == -1 || _total_d < _min_total_d) { _min_total_d = _total_d; _best_offset = _o; }
    }
    
    if (_best_offset != 0) {
        var temp = array_create(samples);
        for(var i=0; i<samples; i++) temp[i] = final_target[(i + _best_offset) % samples];
        final_target = temp;
    }

    board.is_polygon = true;
    board.polygon_is_circle = is_target_circle;
    board.polygon_vertices_start = final_start;
    board.polygon_vertices_target = final_target;
    board.polygon_vertices_clean = target_raw;
    board.polygon_needs_clean = true;
    board.should_revert_to_rectangle = revert;

    if (time <= 0) {
        Anim_Destroy(board, "polygon_fraction");
        board.polygon_fraction = 1;
        ds_list_clear(board.mainboard.listVertex);
        for (var i = 0; i < array_length(final_target); i++) ds_list_add(board.mainboard.listVertex, final_target[i]);
        board.mainboard.updateDivide();
        board.polygon_needs_clean = false;
    } else {
        board.polygon_fraction = 0;
        ds_list_clear(board.mainboard.listVertex);
        for (var i = 0; i < samples; i++) ds_list_add(board.mainboard.listVertex, final_start[i]);
        board.mainboard.updateDivide();
        Anim_Create(board, "polygon_fraction", tween, ease, 0, 1, time);
    }
}