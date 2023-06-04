extends Control

var player_name = 'None'
var name_list = []
var name_listSize = 0


func _ready():
	get_score()
	$ColorRect/RichTextLabel.text = " Seu Score: "+str(Global.fruits)
	pass

func _on_LineEdit_text_changed(new_text):
	player_name = new_text
	pass

func _on_start_pressed():
	if player_name != 'None':
		var valid = true
		for i in range(name_listSize):
			if player_name == name_list[i]:
				valid = false
				break
		if valid:
			Global.player_name = player_name
			get_tree().change_scene("res://Prefabs/game_leaderboard.tscn")
		else:
			print("Nome invalido, escolha outro por favor! ")
	pass

func get_score():
	$HTTP_get.request("http://dreamlo.com/lb/647106dd8f40bb7d84f0df40/json")


func _on_HTTP_get_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var dict = json.result
	dict = dict["dreamlo"]
	dict = dict["leaderboard"]
	dict = dict["entry"]
	name_listSize = len(dict)
	for i in range(name_listSize):
		var page = dict[i]
		name_list.append(page["name"])
	pass


func _on_Timer_timeout():
	get_tree().quit()

