extends Control

#func _ready() -> void:
	#$AnimationPlayer.play("RESET")

func volver():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pausa():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
func esc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pausa()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		volver()



func _on_volver_pressed() -> void:
	volver()


func _on_reiniciar_pressed() -> void:
	volver()
	get_tree().reload_current_scene()


func _on_salir_pressed() -> void:
	get_tree().quit()


func _process(delta: float) -> void:
	esc()
