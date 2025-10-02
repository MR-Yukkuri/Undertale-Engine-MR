///@arg key
///@arg default
///@arg fname
///@arg is_real
///@arg section
///@desc 必須項目を最小限にしたini_read_real / stringです。ini_open / ini_closeは不要です
function LoadFile(key,def=0,fname="save.ini",r=true,section="data"){
	ini_open(fname)
	if r
		var ini = ini_read_real(section,key,def)
	else
		var ini = ini_read_string(section,key,def)
	ini_close()
	return ini
}