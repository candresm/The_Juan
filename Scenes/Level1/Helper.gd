extends Sprite

onready var screen_size = get_viewport_rect().size;
const CELL_SIZE = 48;
const COLOR = Color(1,1,1,0.4);
onready var WIDTH = int(screen_size.x/CELL_SIZE);
onready var HEIGHT = int (screen_size.y/CELL_SIZE); 

func _draw():
	print(screen_size);
	for x in range(WIDTH+1): 
		draw_line(Vector2(CELL_SIZE*x, 0) - self.position, Vector2(CELL_SIZE * x, screen_size.y) - self.position, COLOR,1, true);
	for y in range(HEIGHT+1):
		draw_line(Vector2(0, CELL_SIZE*y) - self.position, Vector2(screen_size.x, CELL_SIZE*y) - self.position, COLOR, 1, true);