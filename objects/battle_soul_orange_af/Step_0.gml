image_alpha-=fs
depth++
if image_alpha <= 0 {
	instance_destroy()
}