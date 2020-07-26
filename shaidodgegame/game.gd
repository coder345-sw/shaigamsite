extends Node2D

var score


func _ready():
	randomize()
	get_node("player").hide()
	get_node("music_boi").play()
	

func _on_enemytimer_timeout():
	var newenemypath = load("res://NME monsters.tscn")
	var newenemy = newenemypath.instance()
	add_child(newenemy)
	
	get_node("enemypath/enemyspawn").set_offset(randi())
	newenemy.position = get_node("enemypath/enemyspawn").position
	
	var direction = get_node("enemypath/enemyspawn").rotation + PI / 2
	direction += rand_range(-PI / 4, PI / 4)
	newenemy.rotation = direction
	
	newenemy.linear_velocity = Vector2(rand_range(newenemy.minspeed, newenemy.maxspeed), 0)
	newenemy.linear_velocity = newenemy.linear_velocity.rotated(direction)

func _on_scoretimer_timeout():
	score += 1
	get_node("UI").updatescore(score)


func _on_starttimer_timeout():
	get_node("scoretimer").start()
	get_node("enemytimer").start()


func _on_player_hit():
	get_node("scoretimer").stop()
	get_node("enemytimer").stop()
	get_node("UI").ShowGameOver()
	get_node("music_boi").stop()
	get_node("ded").play()
	


func _on_UI_startgame():
	score = 0
	get_node("player").position = get_viewport_rect().size / 2
	get_node("player").show()
	get_node("player/CollisionShape2D").set_deferred("disabled", false)
	get_node("starttimer").start()
	get_node("UI").updatescore(score)
	get_node("UI").showmessage("incoming birds!")
	if (!get_node("music_boi").playing):
		get_node("music_boi").play()
		get_node("ded").stop()