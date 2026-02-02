
extends CanvasLayer

var hand: Hand

func _ready() -> void:
	hand = get_node("/root/Main/Hand")

func update_score_label(score: int):
	$ScoreLabel.text = "Masquerade points: " + str(score)

func _on_timer_2_timeout() -> void:
	print("Party is over!")
	$PanelContainer.visible = true
	Engine.time_scale = 0.01

func _process(delta):
	$TimerLabel.text = "Party time remaining: " + str(int($GameTimer.time_left))

func _on_restart_button_pressed() -> void:
	# hide the panel
	$PanelContainer.visible = false
	# reset the timer
	$GameTimer.start()
	# reset guests and score
	hand.restart_game()
