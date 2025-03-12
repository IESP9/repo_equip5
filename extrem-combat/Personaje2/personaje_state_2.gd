class_name PersonajeState2 extends State
@onready var sprite = %Sprite1

const IDLE = "Idle"
const RUN = "Run"
const JUMP = "Jump"
const FALLING = "Falling"
#const LAND = "Land"


var personaje_2: Personaje2

func _ready() -> void:
	await owner.ready
	personaje_2 = owner as Personaje2
	assert(personaje_2 != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
