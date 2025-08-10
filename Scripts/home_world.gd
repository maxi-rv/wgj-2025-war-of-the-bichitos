extends Node2D



func _on_go_to_next_level_area_2d_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		get_tree().change_scene_to_file("res://Scenes/Levels/maze_01.tscn")
