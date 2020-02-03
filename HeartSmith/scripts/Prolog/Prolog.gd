extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _slide : int = 0; 

var _anim_done : = true;
onready var _text  = $Text;
onready var _anim = $AnimationPlayer
onready var _changer = $SceneChanger;

var slide1 : String = " In leagened there was once a blacksmith that had the ability to rebar the broken hearts"

# Called when the node enters the scene tree for the first time.
func _ready():
	_text.show()
	_anim.connect("animation_finished", self , "anim_done")
	_text = slide1;
	pass # Replace with function body.

func _input(event):
	if(event is InputEventKey):
		if(_anim_done):
			_slide += 1;
			_anim.play("fade");
			_anim_done = false;



func _on_AnimationPlayer_animation_finished(anim_name):
	if(_anim_done == false):
		match _slide:
			0:
				_text.text = slide1 ;
			1:
				_text.text = slide1 ;
			2:
				_text.text = slide1 ;
				
		if(_slide <= 3):
				_changer.change_scene("res://scripts/level1/Level1.tscn")
				
		_anim.play_backwards("fade");
		_anim_done = true;
