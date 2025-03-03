extends PlayerState

var gravity := 600.0  # Gravedad (ajusta según tu juego)
var velocity_y := 0.0  # Velocidad vertical

func enter(previous_state_path: String, data := {}) -> void:
	sprite.play("fall")  # Asegúrate de tener una animación llamada "fall"
	state_label.text = "FALLING"

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

	# Cambiar a estado de IDLE si el jugador toca el suelo
	if player.is_on_floor():
		finished.emit(IDLE)
