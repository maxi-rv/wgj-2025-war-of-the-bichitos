extends CharacterBody2D

class_name Bichito

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d = $Area2D
@onready var area_2d_collision_shape_2d = $Area2D/CollisionShape2D

@onready var dialog_scared_sprite_2d = $Dialog_Scared_Sprite2D
@onready var dialog_sad_sprite_2d = $Dialog_Sad_Sprite2D
@onready var dialog_happy_sprite_2d = $Dialog_Happy_Sprite2D

func _ready():
	dialog_happy_sprite_2d.visible = true
	dialog_sad_sprite_2d.visible = false
	dialog_scared_sprite_2d.visible = false

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
