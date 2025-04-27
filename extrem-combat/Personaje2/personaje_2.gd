class_name Personaje2
extends CharacterBody2D

var gui: Node = null
@onready var idleState = %Idle
@onready var hurtTimer = %HurtTimer
@onready var deathTimer = %DeathTimer
@onready var invencibleTimer = %InvencibleTimer
var health = 50 #100
var speed = 250.0
var jump_velocity = -350.0
var invencible = false 

func _ready() -> void:
	gui = get_tree().get_root().find_child("GUI", true, false)

func take_damage(damage):
	if !invencible:
		health -= damage
		#sprite.play("hurt")
		gui.update_player2_health(health)
		print("Vida restante: " + str(health))
		#if health <= 0:
			#print(str(self.name) + " ha muerto")
			#sprite.play("die")
			#queue_free()
		#idleState.finished.emit("Hurt")
		#if health <= 0:
			#queue_free()
		$StateMachine/Hurt.finished.emit("Hurt")

func _on_punch_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		#print("Ha recibido daño") 
		body.take_damage(10) 


func _on_death_timer_timeout() -> void:
	queue_free()
