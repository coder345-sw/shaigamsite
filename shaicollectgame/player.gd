extends Area2D


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
		move.x +=1
	
	if (Input.is_action_pressed("ui_up")):
		move.y-=1
		
	if (Input.is_action_pressed("ui_down")):
			move.y+=1
				
	move = move.normalized()
	position += move * speed * delta
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)
	position.y = clamp(position.y, 0, get_viewport_rect().size.y)

func _on_player_area_entered(area):
	if (area.is_in_group("coins")):
		area.queue_free()
		get_parent().collectCoin()
	if (area.is_in_group("danger")):
		queue_free()
		get_parent().gameover()
