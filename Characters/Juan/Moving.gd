extends "res://Scripting/IState.gd"

func _enter():
	entity.anim_player.play("Move");

func _execute(delta):
	entity.sprite.flip_h =  false if entity.direction.x > 0 else true;

func _evaluate(delta):
	if(entity.direction.x == 0):
		entity.next_state = entity.idle_state; 

func _exit():
	entity.sprite.flip_h = false; 
