extends Node

func load_csv_as_array(csv_path: String) -> Array:
	var _array: Array = []
	
	var file = FileAccess.open(csv_path,FileAccess.READ)
	
	if file == null:
		printerr("No CSV found at path:",csv_path)
		return _array
	
	while not file.eof_reached():
		var line = file.get_line()
		_array.append(line.split(","))
	
	file.close()
	return _array
	

	
	
