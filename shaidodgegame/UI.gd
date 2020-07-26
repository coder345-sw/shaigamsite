extends CanvasLayer

signal startgame

func _on_start_pressed():
	get_node("start").hide()
	emit_signal("startgame")

func _on_messagetimer_timeout():
	get_node("Message").hide()

func showmessage(text):
	get_node("Message").text = text
	get_node("Message").show()
	get_node("messagetimer").start()
	
func ShowGameOver():
	showmessage("ded try again")
	yield(get_node("messagetimer"), "timeout")
	get_node("Message").text = "BIRD ATTACK!"
	get_node("Message").show()
	get_node("start").show()

func updatescore(score):
	get_node("Score").text = str(score)