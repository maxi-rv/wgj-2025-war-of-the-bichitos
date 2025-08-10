extends Node2D

class_name Interacter

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _ready():
	collision_shape_2d.disabled = true

func interact():
	collision_shape_2d.disabled = false
	await get_tree().create_timer(0.1).timeout
	collision_shape_2d.disabled = true
