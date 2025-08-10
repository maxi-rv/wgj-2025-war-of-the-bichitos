extends Node

signal pearl_score_change()

var pearl_score = 0

func _on_score_change():
	pearl_score += 1
	emit_signal("pearl_score_change", pearl_score)

func _reset_score():
	pearl_score = 0
	emit_signal("pearl_score_change", pearl_score)
