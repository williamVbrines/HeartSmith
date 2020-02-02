extends Node2D

onready var _sprite  = $Sprite
onready var _animation = $AnimationPlayer

signal collected; 

func _ready():
	_animation.play("up_down");
	_animation.seek(rand_range(0, _animation.current_animation_length));

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
