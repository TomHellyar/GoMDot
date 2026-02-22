extends Node3D

var element_library : String = "res://data/element_library.csv"
var element_data : Array

var read_data: Array
var elements: Array
var coords: Array
var nframes: int
var frame_ind: int = 0

@onready var cam_pivot: Node3D = $CameraPivot
@onready var cam_controller: SpringArm3D = $CameraPivot/CameraController
	
func _ready() -> void:
	read_data=$TrajLoader.read_traj("res://data/99m_2frame.xyz")
	elements=read_data[0]
	coords=read_data[1]
	nframes=read_data[2]
	
	element_data=$CSVLoader.load_csv_as_array(element_library)

func _process(delta: float) -> void:		
	$Visualiser.vis(elements[frame_ind],coords[frame_ind],frame_ind,element_data)
	if Input.is_action_just_pressed("space"): 
		if frame_ind < (nframes-1):
			frame_ind += 1
		else:
			frame_ind = 0
		$Visualiser.reset()
		$Visualiser.vis(elements[frame_ind],coords[frame_ind],frame_ind,element_data)

	var move_vector = Input.get_vector("left","right","up","down")
	cam_pivot.rotate_y(deg_to_rad(-move_vector.x * 1.5))
	cam_controller.rotate_x(deg_to_rad(-move_vector.y * 1.5))

		
		
		
