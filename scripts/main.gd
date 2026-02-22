extends Node3D

var element_library : String = "res://data/element_library.csv"
var element_data : Array

var read_data: Array
var elements: Array
var coords: Array

func _ready() -> void:
	element_data=$CSVLoader.load_csv_as_array(element_library)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		read_data=$TrajLoader.read_traj("res://data/test.xyz")
		elements=read_data[0]
		coords=read_data[1]
		$Visualiser.vis(elements,coords,element_data)
		
		
		
		
		
