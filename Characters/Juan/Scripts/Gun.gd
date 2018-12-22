extends Sprite

signal shot;

func _physics_process(delta):
	var mouse_position = (get_viewport().get_mouse_position());
	look_at(mouse_position);
	var look_at_vector = (mouse_position - get_parent().position).normalized();
	flip_v = false if Vector2(1,0).dot(look_at_vector) > 0 else true; 
