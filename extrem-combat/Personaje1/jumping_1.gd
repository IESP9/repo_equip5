extends PersonajeState1

# Variables para controlar el salto
var jump_velocity := -400.0  # Velocidad inicial del salto 
var gravity := 800.0  # Gravedad 
var velocity_y := 1.0  # Velocidad vertical

func enter(previous_state_path: String, data := {}) -> void:
	# Inicio del salto
	velocity_y = jump_velocity
	sprite.play("jumping")  
	state_label.text = "JUMPING"

func physics_update(delta: float) -> void:
	# Aplicar gravedad
	velocity_y += gravity * delta 

	# Mover al jugador verticalmente
	personaje_1.velocity.y = velocity_y

	# Mover al jugador horizontalmente 
	var input_direction_x := Input.get_axis("Left", "Right")
	personaje_1.velocity.x = personaje_1.speed * input_direction_x

	# Girar sprite
	if input_direction_x < 0:
		sprite.flip_h = true
	elif input_direction_x > 0:
		sprite.flip_h = false

	# Mover al jugador
	personaje_1.move_and_slide()

	# Cambiar a estado de caída si la velocidad vertical es positiva
	if velocity_y > 0:
		finished.emit(FALLING)

	# Cambiar a estado de caminar si el jugador toca el suelo
	if personaje_1.is_on_floor():
		finished.emit(IDLE)

	# Doble salto
	#if Input.is_action_just_pressed("Spacebar"):
	#	finished.emit(JUMPING)
