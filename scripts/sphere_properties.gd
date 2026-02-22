extends StaticBody3D

# For this to work, I had to go into the MeshInstance3D and enable 
# "Local to Scene" for both the mesh and the material.

func build_sphere(colour,radius) -> void:
	if colour == 'red':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 0, 0)
	elif colour == 'blue':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(0, 0, 1)
	elif colour == 'white':
		$MeshInstance3D.get_active_material(0).albedo_color = Color(1, 1, 1)
		
	$MeshInstance3D.mesh.set_radius(radius)
