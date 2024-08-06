extends RigidBody2D

@export var speed = 800
var screen_bounds
var paddle_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_bounds = get_viewport_rect().size
	paddle_size = $ColorRect.size
	print(screen_bounds)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_position = Vector2.ZERO
	if Input.is_action_pressed('move_up'):
		new_position.y -= 1
	if Input.is_action_pressed('move_down'):
		new_position.y += 1
		
	position += new_position * speed * delta
	position = position.clamp(
		Vector2.ZERO + (paddle_size / 2), 
		screen_bounds - (paddle_size / 2)
	)	
