extends PersonajeState2

func enter(previous_state_path: String, data := {}) -> void:
	sprite.play("run")

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("Left2", "Right2")
	personaje_2.velocity.x = personaje_2.speed * input_direction_x

	if input_direction_x < 0:
		sprite.flip_h = true
		%P1Hitbox2.position = Vector2(-20,-2)
		%P2Hitbox2.position = Vector2(-25,0.5)
	if input_direction_x > 0:
		sprite.flip_h = false
		%P1Hitbox2.position = Vector2(15.5,-2)
		%P2Hitbox2.position = Vector2(20.5,0.5)
	personaje_2.move_and_slide()

	if not personaje_2.is_on_floor():
		finished.emit(FALLING)
	if Input.is_action_just_pressed("Punch2"):
		finished.emit(PUNCH)
	if Input.is_action_just_pressed("Up2"):
		finished.emit(JUMP)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
