extends "res://Scripting/IState.gd"

var sprite
var direction 

func _enter():
	sprite = entity.sprite; 
	entity.anim_player.play("Move");
	direction = entity.direction;

func _execute(delta):
	direction.x = int(Input.is_action_pressed("ui_left")) - int(Input.is_action_pressed("ui_right"));
	print("moving:_executdae():direction: ",  direction);
	sprite.flip_h =  false if direction.x < 0 else true;

func _evaluate(delta):
	if(entity.direction.x == 0):
		entity.next_state = entity.idle_state; 

func _exit():
	sprite.flip_h = false; 