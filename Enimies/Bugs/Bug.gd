extends KinematicBody2D

export var speed = 64
var velocity
var direction = ["Left", "Right", "Up", "Down"]
var left
var right
var up
var down
var last_move

func _physics_process(delta):
	_ready()
	velocity = move_and_slide(velocity)
	_set_animation()
	if $RayCast2D.is_colliding():
		_is_colliding()
		get_direction()
		
func get_direction():
	var random_direction = direction[randi() % direction.size()]
	return random_direction

func _ready():
	left = false
	right = false
	up = false
	down = false
	
	velocity = Vector2()

	if get_direction() == "Right":
		right = true
		velocity.x += 1
		last_move = "right"
	elif get_direction() == "Left":
		left = true
		velocity.x -= 1
		last_move = "left"
	elif get_direction() == "Down":
		down = true
		velocity.y += 1
		last_move = "down"
	elif get_direction() == "Up":
		up = true
		velocity.y -= 1
		last_move = "up"
	
	velocity = velocity.normalized() * speed
	
func _set_animation():
	if right:
		get_node("Anim").play("Right")
	if left:
		get_node("Anim").play("Left")
	if down:
		get_node("Anim").play("Down")
	if up:
		get_node("Anim").play("Up")

func _is_colliding():
	if $RayCast2D.is_colliding():
		if last_move == "right":
			get_node("Anim").play("Right_Idle")
			direction = ["Left", "Up", "Down"]
		if last_move == "left":
			get_node("Anim").play("Left_Idle")
			direction = ["Right", "Up", "Down"]
		if last_move == "down":
			get_node("Anim").play("Down_Idle")
			direction = ["Left", "Up", "Right"]
		if last_move == "up":
			get_node("Anim").play("Up_Idle")
			direction = ["Left", "Right", "Down"]
	
