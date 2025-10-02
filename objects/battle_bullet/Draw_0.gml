if out {
	event_user(2)
}
else {
	surface_set_target(Battle_GetBoardSurface())
	event_user(2)
	surface_reset_target();
}