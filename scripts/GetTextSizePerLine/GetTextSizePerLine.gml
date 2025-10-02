///@desc text_typer専用
function GetTextSizePerLine(TEXT) {
    var lines = string_split(TEXT, "&");
    var results = [];

    // 現在のスケールとフォント（前行から引き継ぐ）
    var scale_x = 1;
    var scale_y = 1;
    var font = 0;
    var cfont = 0;

    for (var l = 0; l < array_length(lines); l++) {
        var line = lines[l];
        var len = string_length(line);

        var width_sum = 0;
        var max_height = 0;

        var segment = "";
        var inside = false;
        var cmd = "";

        // 現在の文字列バッファと対応スケール/フォント
        var buf = "";
        var buf_scale_x = scale_x;
        var buf_scale_y = scale_y;
        var buf_font = font;
        var buf_cfont = cfont;

        for (var i = 1; i <= len; i++) {
            var ch = string_char_at(line, i);

            if (ch == "{") {
                // segment を処理する前にバッファを処理
                if (buf != "") {
                    draw_set_font(_group_font[buf_font, buf_cfont]);
                    width_sum += string_width(buf) * buf_scale_x;
                    // 高さは文字ごとに max をとる
                    for (var j=1; j<=string_length(buf); j++) {
                        var _c = string_char_at(buf,j);
                        max_height = max(max_height, string_height(_c) * buf_scale_y);
                    }
                    buf = "";
                }
                inside = true;
                cmd = "";
            }
            else if (ch == "}") {
                inside = false;

                // コマンド解析 → 次の文字から適用
                var parts = string_split(string_trim(cmd), " ");
                if (array_length(parts) >= 2) {
                    var key = parts[0];
                    var val = parts[1];

                    switch (key) {
                        case "scale":
                            scale_x = real(val);
                            scale_y = real(val);
                            break;
                        case "scale_x":
                            scale_x = real(val);
                            break;
                        case "scale_y":
                            scale_y = real(val);
                            break;
                        case "font":
                            font = real(val);
                            break;
                        // 他は無視
                    }
                }
            }
            else {
                if (inside) {
                    cmd += ch; // コマンド中はバッファに入れない
                } else {
                    // フォントまたはスケールが変わったらバッファを処理
                    var cur_cfont = (ord(ch)<128 ? 0 : 1);
                    if (buf_font != font || buf_cfont != cur_cfont || buf_scale_x != scale_x || buf_scale_y != scale_y) {
                        if (buf != "") {
                            draw_set_font(_group_font[buf_font, buf_cfont]);
                            width_sum += string_width(buf) * buf_scale_x;
                            for (var j=1; j<=string_length(buf); j++) {
                                var _c = string_char_at(buf,j);
                                max_height = max(max_height, string_height(_c) * buf_scale_y);
                            }
                            buf = "";
                        }
                        buf_font = font;
                        buf_cfont = cur_cfont;
                        buf_scale_x = scale_x;
                        buf_scale_y = scale_y;
                    }
                    buf += ch;
                }
            }
        }

        // 残りのバッファ処理
        if (buf != "") {
            draw_set_font(_group_font[buf_font, buf_cfont]);
            width_sum += string_width(buf) * buf_scale_x;
            for (var j=1; j<=string_length(buf); j++) {
                var _c = string_char_at(buf,j);
                max_height = max(max_height, string_height(_c) * buf_scale_y);
            }
        }

        array_push(results, [width_sum, max_height,buf_scale_y]);
    }

    return results;
}
