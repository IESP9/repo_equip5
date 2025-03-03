extends PlayerState

# Variables para controlar el salto
var jump_velocity := -400.0  # Velocidad inicial del salto (ajusta según tu juego)
var gravity := 800.0  # Gravedad (ajusta según tu juego)
var velocity_y := 0.0  # Velocidad vertical

func enter(previous_state_path: String, data := {}) -> void:
	# Iniciar el salto
	velocity_y = jump_velocity
	sprite.play("jumping")  # Asegúrate de tener una animación llamada "jump"
	state_label.text = "JUMPING"

func physics_update(delta: float) -> void:
	# Aplicar gravedad
	velocity_y += gravity * delta

	# Mover al jugador verticalmente
	player.velocity.y = velocity_y

	# Mover al jugador horizontalmente (si hay entrada)
	var input_direction_x := Input.get_axis("Left", "Right")
	player.velocity.x = player.speed * input_direction_x

	# Voltear el sprite si es necesario
	if input_direction_x < 0:
		sprite.flip_h = true
	elif input_direction_x > 0:
		sprite.flip_h = false

	# Mover al jugador
	player.move_and_slide()

	# Cambiar a estado de caída si la velocidad vertical es positiva
	if velocity_y > 0:
		finished.emit(FALLING)

	# Cambiar a estado de caminar si el jugador toca el suelo
	if player.is_on_floor():
		finished.emit(IDLE)

	# Detectar si el jugador quiere saltar nuevamente (doble salto, si lo deseas)
	if Input.is_action_just_pressed("Spacebar"):
		finished.emit(JUMPING)
