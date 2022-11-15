extends Control

var is_paused = false setget set_is_paused;

func _ready():
	$CenterContainer/VBoxContainer/ResumeButton.grab_focus();

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused;

func set_is_paused(value):
	is_paused = value;
	get_tree().paused = is_paused;
	visible = is_paused;

func _on_QuitButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn");

func _on_ResumeButton_pressed():
	self.is_paused = false;
