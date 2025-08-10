extends CharacterBody2D

class_name Pomodoro

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d = $Area2D
@onready var area_2d_collision_shape_2d = $Area2D/CollisionShape2D
@onready var dialog_system: Dialog_system = $Dialog_system

var dialoger_name = "Comodoro Pomodoro"
var dialog_01 = "¡Hola, Gumi Von Dum!"
var dialog_02 = "Te seleccionamos para que vayas en una mision a un planeta desconocido..."
var dialog_03 =  "¡Deberas recuperar un tesoro que es de suma necesidad para nosotros!"
var dialog_04 =  "¡Es de vida o muerte, Gumi Von Dum!"

func _ready():
	pass


func _on_area_2d_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Interacter:
		pass
