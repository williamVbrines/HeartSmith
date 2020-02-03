extends Node2D

var _coloected_hearts = 0;
onready var _lv2 = $HPlack_2;
onready var _lv3 = $VPlack_L3;
onready var _boss = $VPlack_Boss;
 # Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _collected():
	_coloected_hearts += 1;
	
	if(_coloected_hearts >= 3):
		_lv2.can_break = true;
	if(_coloected_hearts >= 6):
		_lv3.can_break = true;
	if(_coloected_hearts >= 10):
		_boss.can_break = true;
		
	pass # Replace with function body.
