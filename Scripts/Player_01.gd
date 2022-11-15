extends KinematicBody2D

export var health = 3;
var hurted = false;
var velocity = Vector2();
var move_speed = 480;
var gravity = 1200;
var jump_force = -360;
var is_grounded;
var knockback_dir = 1;
var knockback_speed = 500;
onready var raycasts = $raycasts;

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta;
	
	_get_input();
	velocity = move_and_slide(velocity);
	is_grounded = _check_is_ground();
	_set_animation();
	
func _get_input():
	velocity.x = 0;
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"));
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.4);
	
	if move_direction != 0:
		$texture.scale.x = move_direction;
		knockback_dir = move_direction;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") && is_grounded:
		velocity.y = jump_force;

func _check_is_ground():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true;
	return false;
	
func _set_animation():
	var animation = "idle";
	
	if !is_grounded:
		animation = "jump";
	
	elif velocity.x != 0:
		animation = "run";
		
	if velocity.y > 0 && !_check_is_ground():
		animation = "fall";
	
	if hurted:
		animation = "hit";
	
	if $animation.assigned_animation != animation:
		$animation.play(animation);

func _knockback():
	velocity.x = -knockback_dir * knockback_speed;
	velocity = move_and_slide(velocity);

func _on_Hurtbox_body_entered(_body):
	health -= 1;
	hurted = true;
	_knockback();
	get_node("Hurtbox/CollisionShape2D").set_deferred("disabled", true);
	yield(get_tree().create_timer(0.6), "timeout");
	get_node("Hurtbox/CollisionShape2D").set_deferred("disabled", false);
	hurted = false;
	if health < 1:
		queue_free();
		get_tree().reload_current_scene();
