extends Control
@onready var P1HealthBar = %P1HealthBar
@onready var P2HealthBar = %P2HealthBar

func update_player2_health(health):
	P2HealthBar.value = health
	print("P2: " + str(P2HealthBar.value))

func update_player1_health(health):
	P1HealthBar.value = health
	print("P1: " + str(P1HealthBar.value))
