extends KinematicBody2D

export (int) var speed = 60

var velocity
var left 
var right 
var up 
var down
var last_move

func get_input():
	left = false
	right = false
	up = false
	down = false
	
	velocity = Vector2()
	
	#MOVIMENTOS COM UMA TECLA
	if Input.is_action_pressed("move_right"):
		_set_audio("right")
		right = true
		velocity.x += 1
		last_move = "right"
	elif Input.is_action_pressed("move_left"):
		_set_audio("left")
		left = true
		velocity.x -= 1
		last_move = "left"
	elif Input.is_action_pressed("move_down"):
		_set_audio("down")
		down = true
		velocity.y += 1
		last_move = "down"
	elif Input.is_action_pressed("move_up"):
		_set_audio("up")
		up = true
		velocity.y -= 1
		last_move = "up"
	
	velocity = velocity.normalized() * speed

func _set_audio(atual):
	if last_move != atual:
		$AudioStreamPlayer2D.play()
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	_set_animation()

func _set_animation():
	if right:
		get_node("Anim").play("Right")
	if left:
		get_node("Anim").play("Left")
	if down:
		get_node("Anim").play("Down")
	if up:
		get_node("Anim").play("Up")

	if not(right or left or down or up):
		_set_idle()

func _set_idle():
	if last_move == "right":
		get_node("Anim").play("Right_Idle")
	if last_move == "left":
		get_node("Anim").play("Left_Idle")
	if last_move == "down":
		get_node("Anim").play("Down_Idle")
	if last_move == "up":
		get_node("Anim").play("Up_Idle")

	if $RayCast2D.is_colliding():
		get_tree().change_scene("res://Menu/Cenas/Fim.tscn");
