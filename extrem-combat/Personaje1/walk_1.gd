extends PersonajeState1

func enter(previous_state_path: String, data := {}) -> void:
	sprite.play("walk")
	state_label.text = "WALK"

func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("Left", "Right")
	personaje_1.velocity.x = personaje_1.speed * input_direction_x

	if input_direction_x < 0:
		sprite.flip_h = true
		%P1Hitbox.position = Vector2(-20,-2)
		%P2Hitbox.position = Vector2(-26,0.25)
	if input_direction_x > 0:
		sprite.flip_h = false
		%P1Hitbox.position = Vector2(14,-2)
		%P2Hitbox.position = Vector2(20,0.25)
	personaje_1.move_and_slide()


	#if not player.is_on_floor():
		#finished.emit(FALLING)
	if Input.is_action_just_pressed("Spacebar"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
