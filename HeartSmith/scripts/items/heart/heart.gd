extends Node2D

onready var _sprite  = $Sprite
onready var _animation = $AnimationPlayer
onready var _audio1 = $Audio1;
onready var _audio2 = $Audio2;
signal collected; 

func _ready():
	_animation.play("up_down");
	_animation.seek(rand_range(0, _animation.current_animation_length));

func _input(event):
	if(_sprite.frame == 1 && event.is_action_pressed("ui_accept")):
		emit_signal("collected");
		match randi() % 2:
			0:
				_audio1.play(0.0);
				_sprite.hide();
				_audio1.connect("finished", self,"_dispose");
			1:
				_audio2.play(0.0);
				_sprite.hide();
				_audio2.connect("finished", self,"_dispose");
#		queue_free();		
		
func _dispose():
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
