///@arg text
function GetPlainTextSplit(TEXT){
	var len = string_length(TEXT);
    var result = "";
    var inside_braces = false;

    for(i=0;i<=len;i++){
        var charr = string_char_at(TEXT,i);

        if(charr = "{"){
            inside_braces = true;
        }
		else if(charr = "}"){
            inside_braces = false;
        }
		if(inside_braces = 0){
            result += charr;
        }
    }
	result = string_replace_all(result,"}","")
	var ii=1
	var res_split = []
	for(var i=0;i<=string_count("&",result);i++) {
		var N = string_pos_ext("&",result,ii)
		var Next = string_pos_ext("&",result,N)
		array_push(res_split,string_copy(result,ii,N>0 ? Next-ii : string_length(result)-ii+1))
		ii = N+1
	}
	return res_split
}
//返回不带命令的文本，返回的结果中不会含有大括号，如果要使用该函数，请保证大括号成对出现