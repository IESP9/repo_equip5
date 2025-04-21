extends PersonajeState1 
func enter(previous_state_path: String, data := {}) -> void:
	personaje_1.hurtTimer.start()
	print("P1Hurt")
	personaje_1.velocity.x = 0.0
	sprite.play("hurt")
	state_label.text = "HURT"
	personaje_1.move_and_slide()
	if personaje_1.health <= 0:
		print(str(self.name) + " ha muerto")
		queue_free()







func _on_hurt_timer_timeout() -> void:
	finished.emit(IDLE)
