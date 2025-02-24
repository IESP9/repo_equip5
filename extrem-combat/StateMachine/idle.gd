extends PlayerState
func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0


func physics_update(delta: float) -> void:

	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("ui_accept"):
		finished.emit(JUMPING)
	elif (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")) and (!Input.is_action_pressed("ui_left") or !Input.is_action_pressed("ui_right")):
		finished.emit(WALK)
