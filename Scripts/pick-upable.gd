extends StaticBody2D

class_name pick_upable

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d_monitorable = $Area2D_Monitorable
@onready var monitorable_collision_shape_2d = $Area2D_Monitorable/CollisionShape2D
@onready var area_2d_monitoring = $Area2D_Monitoring
@onready var monitoring_collision_shape_2d = $Area2D_Monitoring/CollisionShape2D
@onready var audio_stream_player = $AudioStreamPlayer



func _on_area_2d_monitoring_area_entered(area):
	var areaParent = area.get_parent()
	if areaParent is Player:
		audio_stream_player.play()
		await get_tree().create_timer(0.1).timeout
		queue_free()
