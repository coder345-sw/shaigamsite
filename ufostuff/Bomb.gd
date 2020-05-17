extends Area2D

# Create variables here
var direction
var speed
var width
var height

func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 100
	direction.x = rand_range(-1, 1)
	direction.y = rand_range(-1, 1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	get_parent().get_parent().get_node("lose").hide()
func _process(delta):
	position += direction * speed * delta
	if position.x < 0 or position.x > width:
		direction.x *= -1
	if position.y < 0 or position.y > height:
		direction.y *= -1

func _on_bomb_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		get_parent().get_parent().get_node("UFO").queue_free()
		for bomb in get_parent().get_parent().get_node("Bombs").get_children():
			bomb.queue_free()
		get_parent().get_parent().get_node("Explode").play()
		get_parent().get_parent().get_node("lose").show()