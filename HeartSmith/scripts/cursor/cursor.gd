extends Node2D

onready var _sprite = $Sprite;
onready var _anim = $AnimationPlayer;

var _hidden : bool = true;


func _input(event):
	if(event is InputEventKey && _hidden == false):
		_anim.play("fade");
		_hidden = true;
		
		
	if(event is InputEventMouse || event is InputEventMouseButton):	
			if (_hidden == true):
				_anim.play_backwards("fade");
				_hidden = false;
		
	if(event.is_action_pressed("ui_click")):
		_sprite.frame = 1;
	if(event.is_action_released("ui_click")):
		_sprite.frame = 0;
		
		
func _process(delta):
	position = get_global_mouse_position();
