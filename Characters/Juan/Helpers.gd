extends Position2D

func _update_availability(grid_manager):
	if (grid_manager == null):
		printerr("Error: grid has not been initialized for Juan Helpers"); 
		return null;
	else:
		var children = get_children();
		var parent = get_parent();
		for child in children: 
			child.visible = true if (grid_manager._availableG(parent.position + child.offset)) else false;