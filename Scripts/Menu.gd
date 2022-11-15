extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus();

func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn");


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/HowTo.tscn");

func _on_CreditButton_pressed():
	get_tree().change_scene("res://Scenes/Creddits.tscn");


func _on_QuitButton_pressed():
	get_tree().quit();
