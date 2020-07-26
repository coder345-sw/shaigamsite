extends Area2D

signal hit

var speed 
var move

func _ready():
	speed = 350
	move = Vector2()
	position = get_viewport_rect().size / 2
	

func _process(delta):
	move = Vector2()
	
	if (Input.is_action_pressed("ui_left")):
		move.x -= 1
	if (Input.is_action_pressed("ui_right")):
		move.x += 1
	if (Input.is_action_pressed("ui_up")):
		move.y -= 1
	if (Input.is_action_pressed("ui_down")):
		move.y += 1
	
	get_node("AnimatedSprite").play()
	if (move.x < 0):
			get_node("AnimatedSprite").flip_h = true
	if (move.x > 0):
			get_node("AnimatedSprite").flip_h = false
	move.normalized()
	position += move * speed * delta
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)


func _on_player_body_entered(body):
	hide()
	get_node("CollisionShape2D").set_deferred("disabled", true)
	for child in get_parent().get_children():
		print(child.get_name())
		if(child.is_in_group("NME")):
			child.linear_velocity = Vector2(1000, 0)
			child.linear_velocity = child.linear_velocity.rotated(child.rotation)
	emit_signal("hit")
