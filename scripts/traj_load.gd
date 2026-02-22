extends Node

func read_traj(file_path: String):
	var file_split = file_path.rsplit(".", true, 1)
	var file_name = file_split[0]
	var file_ext = file_split[1]
	var read_data: Array
	var elements: Array
	var coords: Array
	
	if file_ext == "xyz":
		read_data=read_xyz(file_path)
		elements=read_data[0]
		coords=read_data[1]
	else:
		printerr("File type",file_ext,"is unsupported.")
		return
	
	return [elements,coords]

func read_xyz(file_path: String) -> Array:
	# .xyz file format:
	# Line 1 = natoms
	# Line 2 = comment line (ignored)
	# Lines 3 to natoms+2 = coordinates
	# (repeat for the number of frames in the file)
	
	var regex_ws = RegEx.create_from_string("\\S+") # Used to split each atom's line by whitespace
	
	var _array: Array = []
	var elements: Array = []
	var coords: Array = []
	
	var xcoord: float
	var ycoord: float
	var zcoord: float
	
	var curr_line: String
	
	var frames: int = 0
	var natoms: int = 0
	var nlines: int = 0
	var nframes: int = 0
	
	
	var file = FileAccess.open(file_path,FileAccess.READ)
	
	if file == null:
		printerr("No file found at path:",file_path)
		return _array
	
	nlines=count_lines(file_path)
	nframes=nlines/(natoms+2)
	
	for f in nframes:
		natoms = int(file.get_line())
		file.get_line()
		for a in natoms:
			curr_line=file.get_line()
			elements.append(regex_ws.search_all(curr_line)[0].get_string())
			xcoord=float(regex_ws.search_all(curr_line)[1].get_string())
			ycoord=float(regex_ws.search_all(curr_line)[2].get_string())
			zcoord=float(regex_ws.search_all(curr_line)[3].get_string())
			coords.append([xcoord,ycoord,zcoord])
	
	file.close()
	return [elements,coords]

func count_lines(file_path: String) -> int:
	var nlines: int = 0
	var file = FileAccess.open(file_path,FileAccess.READ)
	
	while not file.eof_reached():
		file.get_line()
		nlines+=1
		
	return nlines
