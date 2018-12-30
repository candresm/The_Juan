extends "res://Scripting/IState.gd"

enum SUBSTATE{ START, MOVING, DONE, WAIT} 
var current_substate = SUBSTATE.START;
var target_position = Vector2();
var target_direction = Vector2();
var re_entering = false; 
signal moved; 

func _enter():
	if (!re_entering):
		entity.anim_player.play("Move");
		current_substate = SUBSTATE.WAIT;
		re_entering = true; 
	target_position = entity.position + (entity.direction * entity.grid_manager.CELL_SIZE);
	target_direction = entity.direction;
	if (!entity.grid_manager._availableG(target_position) || !entity.grid_manager._availableForCharacters(target_position)):
		current_substate = SUBSTATE.DONE;
	else:
		current_substate = SUBSTATE.START;

func _execute(delta):
	if (current_substate == SUBSTATE.START):
		entity.sprite.flip_h =  false if target_direction.x > 0 else true;
		current_substate = SUBSTATE.MOVING; 
	elif(current_substate == SUBSTATE.MOVING):
		entity.position += target_direction * entity.speed *  delta; 
		if (entity.position.distance_to(target_position) < 2): #if its less than 4 pixels
			entity.position = entity.grid_manager._grid_align(target_position);
			current_substate = SUBSTATE.DONE;
			entity.helpers._update_availability(entity.grid_manager);

func _evaluate(delta):
	if(current_substate == SUBSTATE.DONE):
		if (entity.direction.x != 0):
			_enter();
		else:
			entity.next_state = entity.idle_state; 

func _exit():
	entity.sprite.flip_h = false;
	current_substate = SUBSTATE.WAIT; 
	re_entering = false; 
