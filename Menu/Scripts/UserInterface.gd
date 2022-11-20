extends Control

var is_paused = false setget set_is_paused;
onready var pauseMenu: ColorRect = get_node("PauseMenu")
onready var pauseButton: Button = get_node("PauseButton")

func _on_PauseButton_pressed():
	self.is_paused = not is_paused;
	get_tree().set_input_as_handled()

func set_is_paused(value):
	is_paused = value;
	get_tree().paused = value;
	pauseMenu.visible = value;
	pauseButton.visible = not value;

func _on_ExitButton_pressed():
	get_tree().change_scene("res://Menu/Cenas/Menu.tscn");

func _on_ResumeButton_pressed():
	self.is_paused = false;

