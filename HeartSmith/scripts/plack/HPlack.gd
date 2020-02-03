extends Node2D

onready var _sprite = $Sprite;


var can_break : bool = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	_sprite.frame = 8;
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body is Node2D:
		if body.name == "Player" :
			_sprite.frame = 2;
			
func _on_Area2D_body_exited(body):
	if body is Node2D:
		if body.name == "Player" :
			_sprite.frame = 8;


func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
		if area.name == "Hammer":
			if can_break == true:
				queue_free();	

