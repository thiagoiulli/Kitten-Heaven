extends Area2D

func _on_EndFase_body_entered(_body):
	get_tree().change_scene("res://Menu/Cenas/Fim.tscn");
