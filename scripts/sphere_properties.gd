extends StaticBody3D

# For this to work, I had to go into the MeshInstance3D and enable 
# "Local to Scene" for both the mesh and the material.

func build_sphere(colour,radius) -> void:
	var scale: float = 0.5
	
	add_to_group("visual") # This group will be used to delete all atoms when restarting trajectory.
	
	if colour == 'red':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0, 0)
	elif colour == 'blue':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 0, 1)
	elif colour == 'white':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 1, 1)
	elif colour == 'cyan':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 1, 1)
	elif colour == 'violet':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.5, 0, 0.8)
	elif colour == 'green':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 0.4, 0)
	elif colour == 'yellow':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 1, 0)
	elif colour == 'darkgreen':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 0.2, 0)
	elif colour == 'pink':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0, 0.6)
	elif colour == 'grey':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.3, 0.3, 0.3)
	elif colour == 'darkgrey':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.1, 0.1, 0.15)
	elif colour == 'silver':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.6, 0.6, 0.6)
	elif colour == 'beige':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.7, 0.6, 0.3)
	elif colour == 'orange':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0.45, 0)
	elif colour == 'darkorange':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0.15, 0)
	elif colour == 'darkred':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.5, 0, 0)	
	elif colour == 'darkviolet':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0.3, 0, 0.35)
	elif colour == 'gold':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0.6, 0)
	elif colour == 'lime':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 1, 0)
	
	$MeshInstance3D.mesh.set_radius(scale*radius)
	$MeshInstance3D.mesh.set_height(scale*radius*2)
	
