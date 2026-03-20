if !global.debug
	instance_destroy()
if keyboard_check(vk_control)&&keyboard_check_pressed(ord("D")) {
	visible = !visible
}