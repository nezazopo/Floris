extends "res://scripts/script_rastline/rastlina.gd"
# Called every frame. 'delta' is the elapsed time since the previous frame.
@export var veja_parent_path: NodePath = NodePath("StaticBody3D/bezeg9")

# Folder where generated MultiMeshes will be saved
@export var multimesh_save_folder: String = "res://Generated Multimesh/"

# Material/texture resource
@export var veja_texture_path: String = "res://test_text.tres"

func _init() -> void:
	ime = "Bezeg"
	strupenost = 0 #0, 1, 2
	video = preload("res://assets/rastline/cemaz/cemaz_animacija.ogv")

func _ready() -> void:
	super._ready()
	merge()
	
func _process(_delta: float) -> void:
	pass

func vrniSliko():
	var slika = preload("res://assets/rastline/bezeg/Sambucus_nigra-Busch.jpg")
	return slika

#func vrniLogo()
	#var logo = preload 
	
func vrniOpis():
	var opis = "Za bezeg so značilni pernati listi, plod pa ima trisemensko jagodo. Cvetovi so dvospolni. Združeni so v do 10 cm velike pakobule (navidezne kobule)[1]. Rastlino gojimo, ko je srednje do velik grm ali drobno drevo. Ima plitek koreninski sistem, iz katerega izraščajo koreninski poganjki. Lubje je sivo in rumenkasto rjave barve, površina lubja je pogosto groba oziroma hrapava."
	return opis
	

func merge():
	print("ðŸ” Merging bezeg into MultiMeshInstances + combined collisionâ€¦")

	# --- 0) Cleanup any previous merge output ---
	if has_node("MergedCollisions"):
		get_node("MergedCollisions").queue_free()
	for child in get_children():
		if child is MultiMeshInstance3D:
			child.queue_free()

	# --- 1) Gather all veja nodes under the parent ---
	var parent = get_node_or_null(veja_parent_path)
	if parent == null:
		push_error("âŒ Invalid parent node path.")
		return

	var bezeg = parent.get_children()
	if bezeg.is_empty():
		push_warning("âš ï¸ No veja children found.")
		return

	# --- 2) Group each veja's global_transform by its mesh resource ---
	var mesh_to_transforms = {}
	for veja in bezeg:
		if veja is MeshInstance3D:
			var mesh: Mesh = veja.mesh
			if mesh:
				if not mesh_to_transforms.has(mesh):
					mesh_to_transforms[mesh] = []
				mesh_to_transforms[mesh].append(veja.global_transform)

	if mesh_to_transforms.is_empty():
		push_error("âŒ Couldn't find any MeshInstance3D children with a mesh.")
		return

	# --- 3) Create a single StaticBody3D to hold all collisions ---
	var collision_body = StaticBody3D.new()
	collision_body.name = "MergedCollisions"
	add_child(collision_body)

	# Duplicate each veja's CollisionShape3D into the merged body
	for veja in bezeg:
		if veja is StaticBody3D:
			for shape_node in veja.get_children():
				if shape_node is CollisionShape3D and shape_node.shape:
					var new_shape = CollisionShape3D.new()
					new_shape.shape = shape_node.shape.duplicate()
					collision_body.add_child(new_shape)
					new_shape.global_transform = shape_node.global_transform

	# --- 4) Build & add one MultiMeshInstance3D per unique mesh ---
	var total_instances = 0
	var mesh_index = 0

	# Preload the veja texture once
	#var veja_tex = load(veja_texture_path)

	for mesh in mesh_to_transforms.keys():
		var transforms = mesh_to_transforms[mesh]
		var mm = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = mesh
		mm.instance_count = transforms.size()

		for i in range(transforms.size()):
			mm.set_instance_transform(i, transforms[i])

		var mmi = MultiMeshInstance3D.new()
		mmi.name = "VejaMultiMesh_%d" % mesh_index
		mmi.multimesh = mm
		add_child(mmi)

		# â”€â”€â”€ Apply the texture via a new StandardMaterial3D â”€â”€â”€
		#if veja_tex:
		#	var mat = StandardMaterial3D.new()
		#	mat.albedo_texture = veja_tex
		#	mmi.material_override = mat
		#else:
		#	push_warning("âš ï¸ Could not load texture at '%s'." % veja_texture_path)

		# â”€â”€â”€ Save the MultiMesh resource to disk â”€â”€â”€
		var mesh_id = mesh.resource_path.get_file().get_basename()
		var save_path = multimesh_save_folder.path_join("multimesh_%s.tres" % mesh_id)
		var res = ResourceSaver.save(mm, save_path)
		if res != OK:
			push_error("âŒ Failed to save MultiMesh to %s" % save_path)
		else:
			print("ðŸ’¾ MultiMesh saved to %s" % save_path)

		total_instances += transforms.size()
		mesh_index += 1

	# --- 5) Remove original veja nodes ---
	for veja in bezeg:
		veja.queue_free()

	print("âœ… %d bezeg batched into %d MultiMeshInstance3Ds; collisions merged." %
		  [total_instances, mesh_to_transforms.size()])
