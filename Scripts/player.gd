extends CharacterBody2D

class_name Player

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d = $Area2D
@onready var area_2d_collision_shape_2d = $Area2D/CollisionShape2D

var joystick_connected = false

var move_speed : float = 500
var character_direction : Vector2
var friction: float = 500

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	character_direction = character_direction.normalized()
	
	if character_direction != Vector2.ZERO:
		velocity = character_direction.normalized() * move_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) * Vector2.ZERO
	
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D):
	var areaParent = area.get_parent()
	if !(areaParent is Player):
		pass

func check_connected_joypad():
	if Input.get_connected_joypads().size() > 0:
		joystick_connected = true
	else:
		joystick_connected = false
