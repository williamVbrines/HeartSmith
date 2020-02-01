extends Node2D

onready var _scene_changer = $SceneChanger;

# Called when the node enters the scene tree for the first time.
func _ready():
	_scene_changer.change_scene("res://scripts/testcave/TestCave.tscn");
	pass # Replace with function body.

