extends CharacterBody2D

class_name Bichito

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d = $Area2D
@onready var area_2d_collision_shape_2d = $Area2D/CollisionShape2D
@onready var nav_agent = $NavigationAgent2D

@onready var dialog_scared_sprite_2d = $Dialog_Scared_Sprite2D
@onready var dialog_sad_sprite_2d = $Dialog_Sad_Sprite2D
@onready var dialog_happy_sprite_2d = $Dialog_Happy_Sprite2D

@export var speed = 500

func _ready():
	dialog_happy_sprite_2d.visible = true
	dialog_sad_sprite_2d.visible = false
	dialog_scared_sprite_2d.visible = false
	
	nav_agent.navigation_finished.connect(_on_nav_finished)
	nav_agent.velocity_computed.connect(_on_navigation_agent_2d_velocity_computed)
	make_path(Vector2(
	randf_range(0, get_viewport_rect().size.x),
	randf_range(0, get_viewport_rect().size.y)
	))

func _process(delta):
	var next_path_pos = nav_agent.get_next_path_position()
	var direction = global_position.direction_to(next_path_pos)
	var new_velocity = direction.normalized() * speed
	
	nav_agent.velocity = new_velocity

func _on_nav_finished():
	make_path(Vector2(
	randf_range(0, get_viewport_rect().size.x),
	randf_range(0, get_viewport_rect().size.y)
	))
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, 100)
	move_and_slide()

	
func make_path(pos: Vector2):
	nav_agent.target_position = pos

# Set next destination to player	
func move_towards_player(player_pos: Vector2)-> void:
	nav_agent.target_position = player_pos

func _on_area_2d_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		dialog_happy_sprite_2d.visible = false
		dialog_sad_sprite_2d.visible = true
		dialog_scared_sprite_2d.visible = false


func _on_area_2d_area_exited(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		dialog_happy_sprite_2d.visible = false
		dialog_sad_sprite_2d.visible = false
		dialog_scared_sprite_2d.visible = true
