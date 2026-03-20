event_inherited()

if(warp_active){
	warp_timer++
	if(instance_exists(warp_target_inst)){
		if(warp_target_inst.object_index == battle_pline){
			var angle = warp_target_inst.image_angle
			warp_target_x = warp_target_inst.x+warp_target_dist*dcos(angle)
			warp_target_y = warp_target_inst.y+warp_target_dist*-dsin(angle)
		} else {
			warp_target_x = warp_target_inst.x+lengthdir_x(warp_target_inst.radius,warp_target_dir)
			warp_target_y = warp_target_inst.y+lengthdir_y(warp_target_inst.radius,warp_target_dir)
		}
	}
	var t = warp_timer/warp_duration
	x = lerp(warp_start_x,warp_target_x,t)
	y = lerp(warp_start_y,warp_target_y,t)
	if(warp_timer >= warp_duration){
		warp_active = false
		warp_timer = 0
	}
	exit
}
if(Battle_GetState()==BATTLE_STATE.IN_TURN && moveable){
	var SPD=Player_GetSpdTotal()
	var SPD=(Input_IsHeld(INPUT.CANCEL) ? SPD/2 : SPD)
	var dx = 0
	var dy = 0
	if Input_IsPressed(INPUT.UP) dy = -1
	else if(Input_IsPressed(INPUT.DOWN)) dy = 1
	else if(Input_IsPressed(INPUT.LEFT)) dx = -1
	else if(Input_IsPressed(INPUT.RIGHT)) dx = 1
	
	if dx != 0 || dy != 0 {
		var current_inst = instance_place(x,y,battle_pline)
		if(current_inst == noone) {
			with(battle_pcircle) {
				if abs(point_distance(other.x,other.y,x,y)-radius) < 4 {
					current_inst = id
					break
				}
			}
		}
		
		var can_slide = false
		if(collision_circle(x+dx*2,y+dy*2,0.5,battle_pline,true,false)) can_slide = true
		if !can_slide {
			with(battle_pcircle) {
				if abs(point_distance(other.x+dx*2,other.y+dy*2,x,y)-radius) < 0.5 {
					can_slide = true
					break
				}
			}
		}
		
		if !can_slide {
			for(var i = 5;i < 280;i += 2){
				var tx = x+dx*i
				var ty = y+dy*i
				var target = collision_circle(tx,ty,2,battle_pline,true,false)
				if target == noone {
					with(battle_pcircle) {
						if(abs(point_distance(tx,ty,x,y)-radius) < 4) {
							target = id
							break
						}
					}
				}
				
				if(target != noone){
					if (target == current_inst) {
						if (target.object_index == battle_pcircle) continue
						if (point_distance(x,y,tx,ty) < 20) continue
					} else if (collision_circle(x,y,2,target,true,false)) {
						continue
					}
					
					warp_active = true
					warp_timer = 0
					warp_start_x = x
					warp_start_y = y
					warp_target_inst = target
					
					if target.object_index == battle_pline {
						var angle = target.image_angle
						var dist_proj = dot_product(tx-target.x,ty-target.y,dcos(angle),-dsin(angle))
						warp_target_x = target.x+dist_proj*dcos(angle)
						warp_target_y = target.y+dist_proj*-dsin(angle)
						warp_target_dist = dist_proj
					} else {
						var dir = point_direction(target.x,target.y,tx,ty)
						warp_target_x = target.x+lengthdir_x(target.radius,dir)
						warp_target_y = target.y+lengthdir_y(target.radius,dir)
						warp_target_dir = dir
					}
					var target_safe = true
					var in_board = false
					with(battle_board_extra) {
						if contains(other.warp_target_x,other.warp_target_y) {
							in_board = true
							break
						}
					}
					if !in_board
						target_safe = false
					if target_safe && collision_rectangle(warp_target_x-sprite_width/2,warp_target_y-sprite_height/2,warp_target_x+sprite_width/2,warp_target_y+sprite_height/2,block,false,true)
						target_safe = false
					if target_safe {
						if collision_line(x,y,warp_target_x,warp_target_y,block,false,true) || 
						   collision_line(x,y,warp_target_x,warp_target_y,battle_board_cover,false,true) {
							target_safe = false
						} else {
							if(current_inst != noone && current_inst.object_index == battle_pcircle){
								var x1 = x
								var y1 = y
								var x2 = warp_target_x
								var y2 = warp_target_y
								var cx = current_inst.x
								var cy = current_inst.y
								if(point_distance(x2, y2, cx, cy) >= current_inst.radius-2){
									var l2 = sqr(x2-x1)+sqr(y2-y1)
									var dist_to_center = 0
									if (l2 == 0) {
										dist_to_center = point_distance(cx, cy, x1, y1)
									} else {
										var t = ((cx-x1)*(x2-x1)+(cy-y1)*(y2-y1))/l2
										t = clamp(t, 0, 1);
										dist_to_center = point_distance(cx, cy, x1+t*(x2-x1), y1+t*(y2-y1))
									}

									if(dist_to_center < current_inst.radius-2){
										target_safe = false
									}
								}
							}
						}
						
						if target_safe {
							var dist_path = point_distance(x,y,warp_target_x,warp_target_y)
							var dir_path = point_direction(x,y,warp_target_x,warp_target_y)
							var step_size = 4
							for(var j = step_size;j < dist_path;j += step_size){
								var px = x+lengthdir_x(j,dir_path)
								var py = y+lengthdir_y(j,dir_path)
								var p_in_board = false
								with(battle_board_extra){
									if(contains(px,py)){
										p_in_board = true
										break
									}
								}
								if(!p_in_board){
									target_safe = false
									break
								}
							}
						}
					}

					if target_safe {
						warp_active = true
						warp_timer = 0
						warp_start_x = x
						warp_start_y = y
						break
					}else{
						warp_active = false
					}
				}
			}
		}
	}
	var input_x = (Input_IsHeld(INPUT.RIGHT) ? 1 : 0)-(Input_IsHeld(INPUT.LEFT) ? 1 : 0)
	var input_y = (Input_IsHeld(INPUT.DOWN) ? 1 : 0)-(Input_IsHeld(INPUT.UP) ? 1 : 0)
	var input_mag = point_distance(0,0,input_x,input_y)
	var input_dx = (input_mag > 0 ? input_x/input_mag : 0)
	var input_dy = (input_mag > 0 ? input_y/input_mag : 0)

	repeat(SPD*10){
		var can_move = [false,false,false,false]
		var dirs = [[0,-0.1],[0,0.1],[-0.1,0],[0.1,0]]
		for(var d=0;d<4;d++) {
			var tx = x+dirs[d][0]
			var ty = y+dirs[d][1]
			if collision_circle(tx,ty,2.0,battle_pline,true,false)
				can_move[d] = true
			else {
				with(battle_pcircle) {
					if(abs(point_distance(tx,ty,x,y)-radius) < 2) {
						can_move[d] = true 
							break 
					} 
				} 
			}
		}
		if(Input_IsHeld(INPUT.UP) && !position_meeting(x,y-sprite_height/2,block) && can_move[0])
			y-=0.1
		if(Input_IsHeld(INPUT.DOWN) && !position_meeting(x,y+sprite_height/2,block) && can_move[1])
			y+=0.1
		if(Input_IsHeld(INPUT.LEFT) && !position_meeting(x-sprite_width/2,y,block) && can_move[2])
			x-=0.1
		if(Input_IsHeld(INPUT.RIGHT) && !position_meeting(x+sprite_width/2,y,block) && can_move[3])
			x+=0.1
		var min_score = 999
		var target_inst = noone
		var final_p = 0
		
		with(battle_pline) {
			var ux = dcos(image_angle)
			var uy = -dsin(image_angle)
			var p = dot_product(other.x-x,other.y-y,ux,uy)
			var p_clamped = clamp(p,-image_xscale,image_xscale)
			var dist = point_distance(other.x,other.y,x+p_clamped*ux,y+p_clamped*uy)
			var snap_score = dist
			if(input_mag > 0){
				var alignment = abs(dot_product(input_dx,input_dy,ux,uy))
				snap_score -= alignment*1.5
			}
			
			if (snap_score < 4 && snap_score < min_score) {
				min_score = snap_score
				target_inst = id
				final_p = p_clamped
			}
		}
		with(battle_pcircle) {
			var d = abs(point_distance(other.x,other.y,x,y)-radius)
			var snap_score = d
			if(input_mag > 0){
				var dir = point_direction(x,y,other.x,other.y)
				var tx = lengthdir_x(1,dir+90)
				var ty = lengthdir_y(1,dir+90)
				var alignment = abs(dot_product(input_dx,input_dy,tx,ty))
				snap_score -= alignment*1.5
			}
			
			if (snap_score < 4 && snap_score < min_score) {
				min_score = snap_score
				target_inst = id
			}
		}
		
		if (target_inst != noone) {
			if(target_inst.object_index == battle_pline) {
				var angle = target_inst.image_angle
				x = target_inst.x+final_p*dcos(angle)
				y = target_inst.y+final_p*-dsin(angle)
			} else {
				var dir = point_direction(target_inst.x,target_inst.y,x,y)
				x = target_inst.x+lengthdir_x(target_inst.radius,dir)
				y = target_inst.y+lengthdir_y(target_inst.radius,dir)
			}
		}
	}
}
