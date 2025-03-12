extends PersonajeState2
func enter(previous_state_path: String, data := {}) -> void:
	personaje_2.velocity.x = 0.0
	sprite.play("idle")
	
	
func physics_update(delta: float) -> void:

	personaje_2.move_and_slide()

	if not personaje_2.is_on_floor():
		finished.emit(FALLING)
	if Input.is_action_just_pressed("Up2"):
		finished.emit(JUMP)
	elif (Input.is_action_pressed("Left2") or Input.is_action_pressed("Right2")) and (!Input.is_action_pressed("Left") or !Input.is_action_pressed("Right")):
		finished.emit(RUN)
