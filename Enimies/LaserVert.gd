extends KinematicBody2D

export var speed = 64
var motion = Vector2.ZERO
var move_direction = -1

func _physics_process(delta: float) -> void:
	motion.x = speed * move_direction
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
	
	if $texture.flip_h != $texture.flip_h:
		$ray_wall.scale.x *= - 1
		move_direction *= -1

	motion = move_and_slide(motion)	



