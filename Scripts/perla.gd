extends Area2D

func _ready():
	pass

func _on_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		ScoreManager._on_score_change()
		print("Tengo", ScoreManager.pearl_score, "perlas")
		queue_free()
