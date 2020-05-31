extends Node

var score

func _ready():
	score = 0
	randomize()
	get_node("coinSpawner").set_wait_time(rand_range(1,5))
	get_node("coinSpawner").start()
	get_node("BombSpawner").set_wait_time(rand_range(2,6))
	get_node("BombSpawner").start()
	
	get_node("Ui/GameOver").hide()

func _on_coinSpawner_timeout():
	var newCoinPath = load("res://Coin.tscn")
	var newcoin = newCoinPath.instance()
	get_parent().add_child(newcoin)
	get_node("coinSpawner").set_wait_time(rand_range(1, 5))


func _on_BombSpawner_timeout():
	var newBombPath = load("res://Bomb.tscn")
	var newBomb = newBombPath.instance()
	get_parent().add_child(newBomb)
	get_node("BombSpawner").set_wait_time(rand_range(2, 6))

func gameover():
	get_node("Ui/GameOver").show()
	get_node("Bombhit").play()

func collectCoin():
	score += 1
	get_node("Ui/score").text = "score: " + str(score)
	get_node("coinpickup").play()