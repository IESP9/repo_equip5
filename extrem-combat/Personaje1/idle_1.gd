extends PersonajeState1
func enter(previous_state_path: String, data := {}) -> void:
	personaje_1.velocity.x = 0.0
	sprite.play("idle")
	state_label.text = "IDLE"
	
	
func physics_update(delta: float) -> void:

	personaje_1.move_and_slide()

	#if not player.is_on_floor():
		#finished.emit(FALLING)
	if Input.is_action_just_pressed("Spacebar"):
		finished.emit(JUMPING)
	elif (Input.is_action_pressed("Left") or Input.is_action_pressed("Right")) and (!Input.is_action_pressed("Left") or !Input.is_action_pressed("Right")):
		finished.emit(WALK)
