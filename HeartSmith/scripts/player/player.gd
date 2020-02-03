extends KinematicBody2D

const MAX_WALK_SPEED = 200;
const MAX_RUN_SPEED = 400;
const MAX_JUMP_SPEED = 600;
const MIN_JUMP_SPEED = 200;
const MAX_FALL_SPEED = 200;
const GRAVITY = 40;

const DEADZONE = 1;

onready var _player_top = $Top;
onready var _player_bottom = $Top/Bottom;

onready var _anim = $AnimationPlayer;
onready var _audio = $AudioStreamPlayer;

var _velocity : Vector2 = Vector2(0,0);
var _acceleration : Vector2 = Vector2(20.0,50.0);
var _deceleration : Vector2 = Vector2(20.0,0);
var _dir : int = 0;
var _on_ground : bool = false;
var _can_jump : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("ui_up") && _can_jump == true):
		_audio.play(0.0)
	elif(_on_ground == true && event.is_action("ui_up") && !event.is_action_released("ui_up")):
		_audio.play(0.0)
	if(event.is_action_released("ui_up") && _can_jump == true):
		_can_jump = false;
		_audio.play(0.0)
	
	
		
func _process(delta):
	
	
	if(Input.is_action_pressed("ui_up") && _can_jump):
		if -_velocity.y < MIN_JUMP_SPEED:
			_velocity.y = -MIN_JUMP_SPEED;
		elif -_velocity.y < MAX_JUMP_SPEED:
			_velocity.y -= _acceleration.y;
		else:
			_can_jump = false;
	elif(_on_ground == false):
		_velocity.y += GRAVITY;
			
	if(Input.is_action_pressed("ui_left")):
			_dir = -1;
			_player_top.flip_h = true;
			_player_bottom.flip_h = true;
			_player_bottom.offset.x = 0;
			_player_top.offset.x = -1;
			_anim.walk(true)
	elif(Input.is_action_pressed("ui_right")):
			_dir = 1;
			
			_player_top.flip_h = false;
			_player_bottom.flip_h = false;
			_anim.walk(true)
			
	else:
		_dir = 0;
		_anim.idle();
		
	
	if(Input.is_action_pressed("ui_select") && (abs(_velocity.x) < MAX_RUN_SPEED  && _dir != 0)):
		_velocity.x += (_acceleration.x * _dir);
	elif(abs(_velocity.x) < MAX_WALK_SPEED  && _dir != 0):
		_velocity.x += (_acceleration.x * _dir);
	else:
		if(_velocity.x > -DEADZONE && _velocity.x < DEADZONE ):
			_velocity.x == 0.0;
		if(_velocity.x > 0):
			_velocity.x -= _deceleration.x;
		elif(_velocity.x < 0):
			_velocity.x += _deceleration.x;
			

	
	move_and_slide(_velocity, Vector2(0,-1))

func _on_Ground_body_entered(body):
	if(body != self):
		_velocity.y = 0.0;
		_on_ground = true;
		_can_jump = true;
		

func _on_Ground_body_exited(body):
	if(body != self):
		_on_ground = false;
