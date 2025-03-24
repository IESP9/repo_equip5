extends PersonajeState2

var isIncombo = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

func _ready():
	time = timeTillNextInput 

func _process(delta):
	if(Input.is_action_just_pressed("Punch2")):
		if(currentAttack == 0):
			sprite.play("punch")
