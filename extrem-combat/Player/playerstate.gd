class_name PlayerState extends State
@onready var sprite = %Sprite
@onready var state_label = %StateLabel

const IDLE = "Idle"
const WALK = "Walk"
const JUMPING = "Jumping"
const FALLING = "Falling"


var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
