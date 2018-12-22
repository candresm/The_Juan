extends Node

onready var background = get_node("Background");
onready var midground = get_node("Midground");
onready var foreground = get_node("Foreground");
onready var helper = get_node("Helper");

const CELL_SIZE = 48;
const RIGHT = Vector2(48, 0); 
const LEFT = Vector2(-48, 0); 
const UP = Vector2(0, -48);
const DOWN = Vector2(0, 48); 
const TOPRIGHT = Vector2(48, -48); 
const TOPLEFT = Vector2(-48, -48); 
const BOTTOMRIGHT = Vector2(48, 48); 
const BOTTOMLEFT = Vector2(-48, 48); 
 
var used_cells;
onready var juan_helpers =  get_parent().get_node("Characters/Juan/Helpers"); 

func _ready():
	_init_characters();
	juan_helpers._update_availability(self);


func _grid_align(global_position):
	return (midground.world_to_map(global_position) * CELL_SIZE) + (Vector2(1,1) * CELL_SIZE/2);

func _availableG(global_position):
	return true if (midground.get_cellv(midground.world_to_map(global_position)) == -1) else false; 

func _availableL(grid_position):
	return true if (midground.get_cellv(grid_position) == -1) else false;

func _init_characters():
	var characters = get_node("../Characters").get_children();
	for character in characters:
		character.position = _grid_align(character.position);