extends Node

var atom_scene = preload("res://scenes/atom.tscn")

func vis(elements,coords,element_data):
	var colours: Array = []
	var radii: Array = []
	var sphere_data: Array = []
	sphere_data=set_spheres(elements,element_data) # Set colours and radii for each atom
	
	for i in range(len(elements)):
		inst(coords[i],sphere_data[i])
		

func set_spheres(elements,element_data) -> Array:
	var atomic_labels: Array = []
	var atomic_colours: Array = []
	var atomic_radii: Array = []
	var sphere_data: Array = []
	var label_index : int
	
	for i in element_data:
		atomic_labels.append(i[2])
		atomic_colours.append(i[11])
		atomic_radii.append(i[9])
	
	for i in elements:
		label_index=atomic_labels.find(i)
		sphere_data.append([atomic_colours[label_index],float(atomic_radii[label_index])])
	
	return sphere_data
	
func inst(coords,sphere_data) -> void:
	var pos: Vector3
	var instance = atom_scene.instantiate()
	
	add_child(instance)
	
	pos=Vector3(coords[0],coords[1],coords[2])
	instance.position = pos
	
	instance.build_sphere(sphere_data[0],sphere_data[1])
	
	
