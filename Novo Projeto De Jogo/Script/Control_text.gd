extends Control

onready var text = get_parent().get_node("Dialogue").dialogue_1

var dialogue_index = 0

var finished
var active

var position

var button_pressd: bool = false

var flag = false

func _ready():
	load_dialogue()

func _physics_process(delta):
	if active:
		if (Input.is_action_pressed("passs") or button_pressd == true):
			flag = true
		else:
			if (flag == true):
				if finished == true:
					load_dialogue()
				else:
					$TextBox/Tween.stop_all()
					$TextBox/RichTextLabel.percent_visible = 1
					finished = true
				flag = false
		button_pressd = false
		
		if  $TextBox/Label.text == "Guerrerinho":
			$Guerreiro.visible = true
			if position == "1":
				$Guerreiro.global_position = get_parent().get_node("1").position
		
		if  $TextBox/Label.text == "Chefe da Vila":
			$Chefe.visible = true
			if position == "2":
				$Chefe.global_position = get_parent().get_node("2").position

func load_dialogue():
	if dialogue_index < text.size():
		active = true
		finished = false
		
		$TextBox.visible = true
		$TextBox/RichTextLabel.bbcode_text = text[dialogue_index]["Text"]
		$TextBox/Label.text = text[dialogue_index]["Name"]
		
		position = text[dialogue_index]["Position"]
		
		$TextBox/RichTextLabel.percent_visible = 0
		$TextBox/Tween.interpolate_property($TextBox/RichTextLabel, "percent_visible", 0, 1, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$TextBox/Tween.start()
		
	else:
		$TextBox.visible = false
		finished = true
		active = false
	dialogue_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true

func _on_skip_btn_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn")

func _on_pass_bnt_button_down():
	button_pressd = true
