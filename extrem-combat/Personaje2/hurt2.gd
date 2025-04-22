extends PersonajeState2
func enter(previous_state_path: String, data := {}) -> void:
	personaje_2.invencible = true
	personaje_2.hurtTimer.start()
	get_hurt()


func get_hurt():
	print("P1Hurt")
	personaje_2.velocity.x = 0.0
	sprite.play("hurt")
	personaje_2.move_and_slide()
	if personaje_2.health <= 0:
		#%Collision.set_deferred("disabled", true)
		print(str(get_parent().get_parent().name) + " ha muerto")
		personaje_2.hurtTimer.stop()
		sprite.play("die")
		await sprite.animation_finished
		personaje_2.queue_free()
		
func _on_hurt_timer_timeout() -> void:
	personaje_2.invencible = false
	finished.emit(IDLE)
