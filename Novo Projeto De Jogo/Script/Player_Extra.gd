extends RigidBody2D

var speed = 10.0

func _physics_process(delta):
	apply_impulse(Vector2(), Vector2(Input.get_accelerometer().x * speed, -Input.get_accelerometer().y * speed))
	
