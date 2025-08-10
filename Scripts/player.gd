extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $Area2D_Monitorable/CollisionShape2D
@onready var area_2d_collision_shape_2d = $Area2D_Monitoring/CollisionShape2D

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
	handle_animations()
	move_and_slide()

func handle_animations():
	if character_direction.y > 0:
		animated_sprite_2d.play("down")
		collision_shape_2d.position.x = 4
		collision_shape_2d.position.y = -28
		area_2d_collision_shape_2d.position.x = 4
		area_2d_collision_shape_2d.position.y = -28
	elif character_direction.y < 0:
		animated_sprite_2d.play("up")
		collision_shape_2d.position.x = 4
		collision_shape_2d.position.y = -28
		area_2d_collision_shape_2d.position.x = 4
		area_2d_collision_shape_2d.position.y = -28
	elif character_direction.x > 0:
		animated_sprite_2d.play("right")
		collision_shape_2d.position.x = 88
		collision_shape_2d.position.y = 32
		area_2d_collision_shape_2d.position.x = 88
		area_2d_collision_shape_2d.position.y = 32
	elif character_direction.x < 0:
		animated_sprite_2d.play("left")
		collision_shape_2d.position.x = -60
		collision_shape_2d.position.y = 32
		area_2d_collision_shape_2d.position.x = -60
		area_2d_collision_shape_2d.position.y = 32
	

func _on_area_2d_area_entered(area: Area2D):
	var areaParent = area.get_parent()
	if areaParent is Bichito:
		get_tree().quit()

func check_connected_joypad():
	if Input.get_connected_joypads().size() > 0:
		joystick_connected = true
	else:
		joystick_connected = false
