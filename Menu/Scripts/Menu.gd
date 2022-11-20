extends Control

func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn");
	
func _on_ConfigButton_pressed():
	get_tree().change_scene("res://Menu/Cenas/Config.tscn");
	
func _on_ExitButton_pressed():
	get_tree().quit();

