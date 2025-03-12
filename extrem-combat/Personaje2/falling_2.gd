extends PersonajeState2

var gravity := 800.0  # Gravedad reducida
var velocity_y := 0.0  # Velocidad vertical
var max_fall_speed := 600.0  # Velocidad máxima de caída

func enter(previous_state_path: String, data := {}) -> void:
	# Mantener la animación de salto durante la caída
	sprite.play("jump")  


func physics_update(delta: float) -> void:
	# Aplicar gravedad
	velocity_y += gravity * delta

	# Limitar la velocidad de caída
	velocity_y = min(velocity_y, max_fall_speed)

	# Mover al jugador verticalmente
	personaje_2.velocity.y = velocity_y

	# Mover al jugador horizontalmente 
	var input_direction_x := Input.get_axis("Left2", "Right2")
	personaje_2.velocity.x = personaje_2.speed * input_direction_x * 0.8

	# Girar sprite
	if input_direction_x < 0:
		sprite.flip_h = true
	elif input_direction_x > 0:
		sprite.flip_h = false

	# Mover al jugador
	personaje_2.move_and_slide()

	# Cambiar a estado de IDLE si el jugador toca el suelo
	if personaje_2.is_on_floor():
		# Reproducir animación de aterrizaje
		await get_tree().create_timer(0.3).timeout  # Esperar un poco antes de cambiar a IDLE
		finished.emit(IDLE)
