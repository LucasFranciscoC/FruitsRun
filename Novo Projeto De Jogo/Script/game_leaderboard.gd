extends Node2D

var score_text = ""

var timer = Timer

func _ready():
	add_score()
	pass

func add_score():
	$HTTP_add.request("http://dreamlo.com/lb/sVTUY3yfU0qNCTaXu9iL3Qc8bHi592mUiag1bzhl3NNg/add/"+Global.player_name+"/"+ str(Global.fruits))

#+Global.player_name+
#+ str(Global.fruits)
func get_score():
	$HTTP_get.request("http://dreamlo.com/lb/647106dd8f40bb7d84f0df40/json")
	timer = $Timer
	timer.wait_time = 8
	timer.start()

func _on_HTTP_add_request_completed(result, response_code, headers, body):
	get_score()


func _on_HTTP_get_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var dict = json.result
	dict = dict["dreamlo"]
	dict = dict["leaderboard"]
	dict = dict["entry"]
	var size = len(dict)
	for i in range(size):
		var page = dict[i]
		score_text += "Player: "+page["name"]+" Score: "+str(page["score"])+"\n"
		$score.text = score_text


func _on_Timer_timeout():
	get_tree().quit()
