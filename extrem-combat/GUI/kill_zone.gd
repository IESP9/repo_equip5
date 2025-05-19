extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Personaje1:
		get_tree().change_scene_to_file("res://Escenarios/win_2.tscn")
	if body is Personaje2:
		get_tree().change_scene_to_file("res://Escenarios/win_1.tscn")
