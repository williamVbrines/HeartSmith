extends Label

var _count = 0;

func _on_Heart_collected():
	_count += 1;
	text = str(_count);

