extends Control


func _ready():
	$controls/starBtn.grab_focus()


func _on_starBtn_pressed():
	get_tree().change_scene("res://Scene/Historia.tscn")


func _on_controlsBtn_pressed():
	var controlScreen = load("res://Scene/controlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)


func _on_quitBtn_pressed():
	get_tree().quit()
