extends Node2D

onready var _bg = $BG;

func _input(event):
	if(event.is_action_pressed("ui_map")):
		if(_bg.visible):
			_bg.hide();
		else:
			_bg.show();
