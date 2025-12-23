if out {
	event_user(2)
}
else {
	surface_set_target(Battle_GetBoardSurface())
	var _mode_src = gpu_get_blendmode_src()
	var _mode_dest = gpu_get_blendmode_dest()
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
	event_user(2)
	gpu_set_blendmode_ext(_mode_src, _mode_dest)
	surface_reset_target()
}