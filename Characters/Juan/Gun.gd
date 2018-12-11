extends Sprite

signal shot;

func _physics_process(delta):
	var mouse_position = (get_viewport().get_mouse_position());
	look_at(mouse_position);
	##-----optimize this eventually-----
	var angle = int(abs(rotation_degrees))%360;
	##---------------------------------
	if (angle >= 90 && angle <= 270):
		flip_v = true; 
	else:
		flip_v = false;
	
