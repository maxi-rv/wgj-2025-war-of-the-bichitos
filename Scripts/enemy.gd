extends CharacterBody2D

class_name Enemy

@onready var kill_zone: Area2D
@onready var threat_area: Area2D

@export var speed: int = 400


func _physics_process(delta):
	pass
	
