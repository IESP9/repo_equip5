class_name Personaje1

extends CharacterBody2D

var gui: Node = null
@onready var idleState = %Idle
@onready var hurtTimer = %HurtTimer
@onready var deathTimer = %DeathTimer
@onready var invencibleTimer = %InvencibleTimer
var health = 100
var speed = 250.0
var jump_velocity = -350.0
var invencible = false 
var dead = false

func _ready() -> void:
	gui = get_tree().get_root().find_child("GUI", true, false)

func _on_punch_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		#print("Ha recibido daño")
		body.take_damage(10) 

func adjust_punch_collisions_and_flip_sprite(input_direction_x) -> void:
	if input_direction_x < 0:
		%Sprite.flip_h = true
		%P1Hitbox.position = Vector2(-20,-2)
		%P2Hitbox.position = Vector2(-26,0.25)
	if input_direction_x > 0:
		%Sprite.flip_h = false
		%P1Hitbox.position = Vector2(14,-2)
		%P2Hitbox.position = Vector2(20,0.25)

func take_damage(damage):
	if !invencible:
		health -= damage
		#sprite.play("hurt")
		gui.update_player1_health(health)
		print("Vida restante: " + str(health))
		#if health <= 0:
			#print(str(self.name) + " ha muerto")
			#sprite.play("die")
			#queue_free()
		#enter_hurt = true
		$StateMachine/Hurt.finished.emit("Hurt")
		

func _on_death_timer_timeout() -> void:
	queue_free()
