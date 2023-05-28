extends Camera2D

const SENSITIVITY = 0.5  # Ajuste a sensibilidade de acordo com a preferência

var gyro_node

func _ready():
	if(has_node("/root/Gyro")):
		gyro_node = get_node("/root/Gyro")
		gyro_node.add_to_group("gyro")
		set_process_internal(true)

func _fixed_process(delta):
	if gyro_node:
		gyro_node._process(delta)
		var rotation = gyro_node.rotation
		var move_vector = Vector2(rotation.y, rotation.x) * SENSITIVITY * delta
		offset = offset + move_vector
