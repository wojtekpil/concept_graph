tool
class_name ConceptNodeTransformJitter
extends ConceptNode


func _init() -> void:
	set_input(0, "Transforms", ConceptGraphDataType.TRANSFORM)
	set_input(1, "Amount", ConceptGraphDataType.VECTOR)
	set_input(2, "Seed", ConceptGraphDataType.SCALAR)
	set_output(0, " ", ConceptGraphDataType.TRANSFORM)


func get_node_name() -> String:
	return "Jitter"


func get_category() -> String:
	return "Transforms"


func get_description() -> String:
	return "Applies a random offset to each transforms"


func get_output(idx: int) -> Spatial:
	var transforms = get_input(0)
	var amount = get_input(1)
	var input_seed = get_input(2)

	print("Amount : ", amount)

	if not transforms:
		return null
	if amount == null:
		print("Not amount")
		amount = Vector3.ONE
	if not input_seed:
		input_seed = 0

	var rand = RandomNumberGenerator.new()
	rand.seed = input_seed

	for i in range(transforms.size()):
		var offset := Vector3.ZERO
		offset.x = rand.randf_range(-1.0, 1.0) * amount.x
		offset.y = rand.randf_range(-1.0, 1.0) * amount.y
		offset.z = rand.randf_range(-1.0, 1.0) * amount.z

		transforms[i].origin += offset

	return transforms
