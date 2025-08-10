extends PathFollow2D

@export var speed = .5

func _process(delta):
	progress_ratio += delta * speed
