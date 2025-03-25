extends PersonajeState1

var isInCombo = false
var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var idleDelay = 0.288  # Tiempo de espera antes de volver a Idle
var idleTimer = 0

func _ready():
	time = timeTillNextInput

func _process(delta):
	if Input.is_action_just_pressed("Punch"):
		if not isInCombo:
			# Inicia el combo
			isInCombo = true
			currentAttack = 0
			_Play_Attack_Animation()
		elif isInCombo and time > 0:
			# Avanza al siguiente ataque en el combo
			currentAttack += 1
			_Play_Attack_Animation()

	if isInCombo:
		time -= delta
		if time < 0:
			# Resetea el combo si se acaba el tiempo
			_Reset_Combo()

	if idleTimer > 0:
		idleTimer -= delta
		if idleTimer <= 0:
			sprite.play("idle")

func _Play_Attack_Animation():
	if currentAttack == 0:
		sprite.play("punch")
	elif currentAttack == 1:
		sprite.play("superpunch")
	else:
		# Si se excede el número de ataques, resetea el combo
		_Reset_Combo()
		return

	# Reinicia el temporizador para el siguiente ataque
	time = timeTillNextInput

func _Reset_Combo():
	isInCombo = false
	currentAttack = 0
	time = timeTillNextInput
	idleTimer = idleDelay  # Inicia el temporizador para volver a Idle
