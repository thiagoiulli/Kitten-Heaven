extends KinematicBody2D

export var speed = 64;
export var health = 2;
var gravity = 1200;
var velocity = Vector2.ZERO;
var move_direction = -1;
var hitted = false;

func _physics_process(delta):
	velocity.y += gravity * delta;
	velocity.x = speed * move_direction;
	
	if move_direction == 1:
		$Enemy.flip_h = true;
	else:
		$Enemy.flip_h = false;
	
	_set_animation();
	
	velocity = move_and_slide(velocity);

func _on_animation_animation_finished(anim_name):
	if anim_name == "idle":
		$raycast.scale.x *= -1;
		move_direction *= -1;
		$animation.play("run");

func _set_animation():
	var animation = "run";
	
	if $raycast.is_colliding():
		animation = "idle";
	
	elif velocity.x != 0:
		animation = "run";
		
	if hitted:
		animation = "hit";
	
	if $animation.assigned_animation != animation:
		$animation.play(animation);

func _on_Hitbox_body_entered(body):
	hitted = true;
	health -= 1;
	
	body.velocity.y -= 300;
	yield(get_tree().create_timer(0.2), "timeout");
	hitted = false;
	
	if health < 1:
		queue_free();
		get_node("Hitbox/CollisionShape2D").set_deferred("disabled", true);
