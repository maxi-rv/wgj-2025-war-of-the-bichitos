extends CharacterBody2D

class_name Bichito_03

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $Area2D_Monitorable/CollisionShape2D
@onready var area_2d_collision_shape_2d = $Area2D_Monitoring/CollisionShape2D

@export var player: CharacterBody2D

func _ready():
	pass

func _physics_process(delta):
	if player != null:
		if player.position.x > global_position.x:
			animated_sprite_2d.play("right")
		elif player.position.x < global_position.x:
			animated_sprite_2d.play("left")

func _on_area_2d_monitoring_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		player = areaParent


func _on_area_2d_monitoring_area_exited(area):
	pass # Replace with function body.
