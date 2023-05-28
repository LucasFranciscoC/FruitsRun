extends Node2D


func _ready():
	if (Input.is_gyroscope_enabled()):
		Input.set_accelerometer_as_gyroscope(true)
	else:
		print("Giroscopio não suportado" )

func _process(delta):
	var rotation = Input.get_gyroscope()
