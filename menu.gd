extends Control


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/home_world.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/creditos.tscn")
