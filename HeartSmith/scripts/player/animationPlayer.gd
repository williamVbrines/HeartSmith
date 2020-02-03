extends AnimationPlayer

var is_walking : bool = false


func _ready():
	connect("animation_finished", self , "_anim_states");
	play("idle");
	
func walk(tof : bool = true):
	
	if (is_walking == false):
		clear();
		play("walk");
		
		is_walking = tof;
		
func idle():
	clear();
	play("idle")
	
func clear():
	is_walking = false;
	
func _anim_states(anim : String = "idle"):
	match (anim):
		"idle":
			play("idle");
		"wlak":
			if(is_walking):
				play("walk");
			else:
				play("idle");
	pass
