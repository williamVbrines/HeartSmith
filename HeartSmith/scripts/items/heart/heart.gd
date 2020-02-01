extends Node2D

onready var _sprite  = $Sprite

signal collected; 

func _input(event):
	if(_sprite.frame == 1 && event.is_action_pressed("ui_accept")):
		emit_signal("collected");
		queue_free();		
		

func _on_Area2D_body_entered(body):
	if body is Node2D:
		if(body.name == "Player"):
			_sprite.frame = 1;


func _on_Area2D_body_exited(body):
	if body is Node2D:
		if(body.name == "Player"):
			_sprite.frame = 0;
