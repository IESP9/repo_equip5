extends PersonajeState1 

func enter(previous_state_path: String, data := {}) -> void:
	personaje_1.invencible = true
	personaje_1.hurtTimer.start()
	personaje_1.invencibleTimer.start()
	get_hurt()

func get_hurt():
	print("P1Hurt")
	personaje_1.velocity.x = 0.0
	sprite.play("idle")
	sprite.play("hurt")
	personaje_1.move_and_slide()
	if personaje_1.health <= 0:
		personaje_1.deathTimer.start()
		#%Collision.set_deferred("disabled", true)
		print(str(get_parent().get_parent().name) + " ha muerto")
		personaje_1.hurtTimer.stop()
		sprite.play("die")
		%Collision1.set_deferred("disabled", true)
		#await sprite.animation_finished
		#personaje_1.queue_free()

func _on_hurt_timer_timeout() -> void:
	finished.emit(IDLE)


func _on_invencible_timer_timeout() -> void:
	personaje_1.invencible = false
