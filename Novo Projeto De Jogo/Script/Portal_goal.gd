extends Area2D
onready var changer = get_parent().get_node("Transition_in")
export var path : String

func _ready():
	pass

func _on_Portal_goal_body_entered(body: Node) -> void:
	if body.name == "Player":
		$victory_fx.play()
		$Music.stop()
		changer.change_scene(path)
