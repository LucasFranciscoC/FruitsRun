extends Area2D

func _on_saw_body_entered(body):
	get_tree().reload_current_scene()
