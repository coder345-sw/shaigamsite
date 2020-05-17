extends Area2D

# Create variables here
var direction
var speed
var width
var height
var score

func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 00
	direction.x = rand_range(-1, 1)
	direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	score = 0
func _process(delta):
	position += direction * speed * delta
	if position.x < 0 or position.x > width:
		direction.x *= -1
	if position.y < 0 or position.y > height:
		direction.y *= -1

func _on_UFO_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		direction.x = rand_range(-1, 1)
		direction.y = rand_range(-1, 1)
		direction = direction.normalized()
		position.x = rand_range(0, width)
		position.y = rand_range(0, height)
		speed *= 00 
		var newBombPath = load("res://Bomb.tscn")
		var newBomb = newBombPath.instance()
		get_parent().get_node("Bombs").add_child(newBomb)
		newBomb.speed += 10
		get_node("hitsound").play()
		score += 1
		get_parent().get_node("Score").text = "Score: " + str(score)