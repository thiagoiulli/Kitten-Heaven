extends KinematicBody2D

export var speed = 64;
var velocity = Vector2();
var move_direction = 1;

func _physics_process(_delta):
	velocity.y = speed * move_direction;
	_set_direction();
	velocity = velocity.normalized() * speed;
	velocity = move_and_slide(velocity);


func _set_direction():
	if $RayCast2.is_colliding():
		move_direction = -1;
		get_node("Anim").play("Up");
	
	elif $RayCast4.is_colliding():
		move_direction = 1;
		get_node("Anim").play("Down");
