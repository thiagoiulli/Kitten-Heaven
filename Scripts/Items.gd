extends Area2D


func _on_items_body_entered(_body):
	$animation.play("collision");
	


func _on_animation_animation_finished(anim_name):
	if(anim_name == "collision"):
		queue_free();
