class_name PersonajeState1 extends State
@onready var sprite = %Sprite
@onready var state_label = %StateLabel

const IDLE = "Idle"
const WALK = "Walk"
const JUMPING = "Jumping"
const FALLING = "Falling"
const PUNCH = "Punch"
const HURT = "Hurt"
const DIE = "Die"
#const SUPERPUNCH = "Superpunch"


var personaje_1: Personaje1

func _ready() -> void:
	await owner.ready
	personaje_1 = owner as Personaje1
	assert(personaje_1 != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
