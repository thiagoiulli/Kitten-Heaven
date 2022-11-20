extends KinematicBody2D

export (int) var speed = 60;

var velocity
var last_move


func get_input():
	velocity = Vector2()
	
	#MOVIMENTOS COM UMA TECLA
	if Input.is_action_pressed("move_right"):
		_set_audio("right")
		velocity.x += 1
		last_move = "right"
		get_node("Anim").play("Right")
	elif Input.is_action_pressed("move_left"):
		_set_audio("left")
		velocity.x -= 1
		last_move = "left"
		get_node("Anim").play("Left")
	elif Input.is_action_pressed("move_down"):
		_set_audio("down")
		velocity.y += 1
		last_move = "down"
		get_node("Anim").play("Down")
	elif Input.is_action_pressed("move_up"):
		_set_audio("up")
		velocity.y -= 1
		last_move = "up"
		get_node("Anim").play("Up")
	
	else:
		_set_idle();
	
	velocity = velocity.normalized() * speed

func _set_audio(atual):
	if last_move != atual:
		$AudioStreamPlayer2D.play()
	
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func _set_idle():
	if last_move == "right":
		get_node("Anim").play("Right_Idle")
	if last_move == "left":
		get_node("Anim").play("Left_Idle")
	if last_move == "down":
		get_node("Anim").play("Down_Idle")
	if last_move == "up":
		get_node("Anim").play("Up_Idle")


func _on_hurtbox_body_entered(_body):
	get_tree().reload_current_scene();
