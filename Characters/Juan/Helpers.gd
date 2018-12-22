extends Position2D

func _update_availability(grid_manager):
	if (grid_manager == null):
		printerr("Error: grid has not been initialized for Juan Helpers"); 
		return null;
	else:
		var children = get_children();
		for child in children: 
			if (grid_manager._availableG(child.to_global(child.position + child.offset))):
				continue; 
			child.visible = false; 