extends KinematicBody2D
export (int) var speed = 60
var velocity

func _ready():
	position.inici
	velocity.x += 1
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	get_node("Anim").play("menu")
		
