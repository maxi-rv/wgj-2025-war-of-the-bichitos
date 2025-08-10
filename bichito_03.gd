extends CharacterBody2D

class_name Bichito_03

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $Area2D_Monitorable/CollisionShape2D
@onready var area_2d_collision_shape_2d = $Area2D_Monitoring/CollisionShape2D

@onready var dialog_scared_sprite_2d = $Dialog_Scared_Sprite2D
@onready var dialog_sad_sprite_2d = $Dialog_Sad_Sprite2D
@onready var dialog_happy_sprite_2d = $Dialog_Happy_Sprite2D

@export var player: CharacterBody2D

func _ready():
	dialog_happy_sprite_2d.visible = true
	dialog_sad_sprite_2d.visible = false
	dialog_scared_sprite_2d.visible = false
	
	

func _physics_process(delta):
	if player != null:
		if player.position.x > global_position.x:
			animated_sprite_2d.play("right")
		elif player.position.x < global_position.x:
			animated_sprite_2d.play("left")

	
func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, 100)
	move_and_slide()


func _on_area_2d_monitoring_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		player = areaParent
