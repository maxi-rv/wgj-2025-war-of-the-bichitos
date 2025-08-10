extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var area_2d_monitorable = $Area2D_Monitorable
@onready var monitorable_collision_shape_2d = $Area2D_Monitorable/CollisionShape2D
@onready var area_2d_monitoring = $Area2D_Monitoring
@onready var monitoring_collision_shape_2d = $Area2D_Monitoring/CollisionShape2D
@onready var interacter = $Interacter


var joystick_connected = false

var move_speed : float = 500
var character_direction : Vector2
var friction: float = 500

func _ready():
	interacter

func _physics_process(delta):
	
	handle_interaction_input()
	handle_movement_input(delta)
	handle_animations()

func handle_interaction_input():
	if(Input.is_action_pressed("interact")):
		interacter.interact()

func handle_movement_input(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	character_direction = character_direction.normalized()
	
	if character_direction != Vector2.ZERO:
		velocity = character_direction.normalized() * move_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta) * Vector2.ZERO
	
	move_and_slide()

func handle_animations():
	if character_direction.y > 0:
		animated_sprite_2d.play("down")
		monitorable_collision_shape_2d.position.x = 4
		monitorable_collision_shape_2d.position.y = -28
		monitoring_collision_shape_2d.position.x = 4
		monitoring_collision_shape_2d.position.y = -28
		interacter.position.x = 4
		interacter.position.y = -28
	elif character_direction.y < 0:
		animated_sprite_2d.play("up")
		monitorable_collision_shape_2d.position.x = 4
		monitorable_collision_shape_2d.position.y = -28
		monitoring_collision_shape_2d.position.x = 4
		monitoring_collision_shape_2d.position.y = -28
		interacter.position.x = 4
		interacter.position.y = -28
	elif character_direction.x > 0:
		animated_sprite_2d.play("right")
		monitorable_collision_shape_2d.position.x = 88
		monitorable_collision_shape_2d.position.y = 32
		monitoring_collision_shape_2d.position.x = 88
		monitoring_collision_shape_2d.position.y = 32
		interacter.position.x = 88
		interacter.position.y = 32
	elif character_direction.x < 0:
		animated_sprite_2d.play("left")
		monitorable_collision_shape_2d.position.x = -60
		monitorable_collision_shape_2d.position.y = 32
		monitoring_collision_shape_2d.position.x = -60
		monitoring_collision_shape_2d.position.y = 32
		interacter.position.x = -60
		interacter.position.y = 32
	
func _on_area_2d_area_entered(area: Area2D):
	var areaParent = area.get_parent()
	if areaParent is Bichito_01 || areaParent is Bichito_02:
		get_tree().quit()

func check_connected_joypad():
	if Input.get_connected_joypads().size() > 0:
		joystick_connected = true
	else:
		joystick_connected = false
