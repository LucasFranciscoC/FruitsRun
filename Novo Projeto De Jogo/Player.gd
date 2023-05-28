extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 300
const MAXSPEED = 150
const JUMPFORCE = 500
const ACCEL = 20

var motion = Vector2()
var facing_right = true

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("direita"):
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("esquerda"):
		motion.x -= ACCEL
		facing_right = false
		$AnimationPlayer.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("Idle")
	
	if is_on_floor():
		if Input.is_action_just_pressed("pulo"):
			motion.y = - JUMPFORCE
			$jump_fx.play()
			$AnimationPlayer.play("Jump")
	if !is_on_floor():
		if motion.y <0:
			$AnimationPlayer.play("Jump")
		if motion.y >0:
			$AnimationPlayer.play("Fall")
	motion = move_and_slide(motion, UP)
	
	for platforms in get_slide_count():
		var collision = get_slide_collision(platforms)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)


func _on_headCollider_body_entered(body: Node) -> void:
	if body.has_method("destroy"):
		body.destroy()

