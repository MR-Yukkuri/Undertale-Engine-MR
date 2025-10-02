if mode == 1 {
	body_x = sin(b/14)*2
	body_y = sin(b/7)*2
	head_x = sin(b/14)*3
	head_y = sin(b/7)*3
	b++
}
else if mode == 2 {
	body_x = 0
	body_y = sin(b/35)*3
	head_x = 0
	head_y = sin(b/35)*4
	b++
}
else {
	body_x = 0
	body_y = 0
	head_x = 0
	head_y = 0
	b = 0
}