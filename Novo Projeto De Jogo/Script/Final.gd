extends Node2D

var timer = Timer

func _ready():
	timer = $Timer
	timer.wait_time = 10
	timer.start()
	pass

func _on_Timer_timeout():
	get_tree().change_scene("res://Scene/Save_score.tscn")
