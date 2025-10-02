///@arg key
///@arg value
///@arg fname
///@arg section
///@desc 必須項目を最小限にしたini_write_real / stringです。ini_open / ini_closeは不要です。
function SaveFile(key,value,fname="save.ini",section="data"){
	ini_open(fname)
	if is_real(value)
		ini_write_real(section,key,value)
	else
		ini_write_string(section,key,value)
	ini_close()
}