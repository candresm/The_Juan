extends "res://Scripting/IState.gd"

func _enter():
	entity.anim_player.play("Jump");