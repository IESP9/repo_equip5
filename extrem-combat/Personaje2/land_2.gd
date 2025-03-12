extends PersonajeState2
func enter(previous_state_path: String, data := {}) -> void:
	sprite.play("Land")
	# Esperar a que la animación termine
	await sprite.animation_finished
	# Cambiar al estado Idle
	finished.emit(IDLE)
	
func physics_update(delta: float) -> void:
	pass
