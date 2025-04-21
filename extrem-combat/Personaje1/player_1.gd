class_name Personaje1

extends PersonajeState1

var gui: Node = null
@onready var idleState = %Idle
@onready var hurtTimer = %HurtTimer
var health = 100
var speed = 250.0
var jump_velocity = -350.0


func _ready() -> void:
	gui = get_tree().get_root().find_child("GUI", true, false)

func _on_punch_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		#print("Ha recibido daño")
		body.take_damage(10) 


func take_damage(damage):
	health -= damage
	#sprite.play("hurt")
	gui.update_player1_health(health)
	print("Vida restante: " + str(health))
	#if health <= 0:
		#print(str(self.name) + " ha muerto")
		#sprite.play("die")
		#queue_free()
	#enter_hurt = true
	idleState.finished.emit("Hurt")
