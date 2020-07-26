extends RigidBody2D

var minspeed
var maxspeed
var enemytypes


func _ready():
	minspeed = 150
	maxspeed = 300
	enemytypes = randi() % 3
	
	
	if (enemytypes == 0):
		get_node("AnimatedSprite").animation = "enemy1"
	elif (enemytypes == 1):
		get_node("AnimatedSprite").animation = "enemy2"
	elif (enemytypes == 2):
		get_node("AnimatedSprite").animation = "enemy3"
	
	get_node("AnimatedSprite").play()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
