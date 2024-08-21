extends RigidBody2D

@export var speed = 800
@export var normal = Vector2(0, 0)
var screen_bounds
var paddle_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_bounds = get_viewport_rect().size
	paddle_size = $ColorRect.size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_position = Vector2.ZERO
	if Input.is_action_pressed('move_up'):
		new_position.y -= 1
	if Input.is_action_pressed('move_down'):
		new_position.y += 1
		
	self.linear_velocity = new_position * speed
	self.position += new_position * speed * delta
	self.position = position.clamp(
		Vector2.ZERO + (paddle_size / 2), 
		screen_bounds - (paddle_size / 2)
	)


func get_body_normal():
	return self.normal.rotated(randf_range(-PI / 16, PI / 16))
