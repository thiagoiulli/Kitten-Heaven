extends Control

func _on_HowToButton_pressed():
	get_tree().change_scene("res://Menu/Cenas/HowTo.tscn");

func _on_CredditsButton_pressed():
	get_tree().change_scene("res://Menu/Cenas/Creddits.tscn");
	
func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menu/Cenas/Menu.tscn");
