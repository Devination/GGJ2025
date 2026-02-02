
extends CanvasLayer

var timer = 0

func update_score_label(score: int):
	$ScoreLabel.text = "Score: " + str(score)

func _on_timer_2_timeout() -> void:
	print("Party is over!")
	
func updateTimer():
	$Timer.text = str($Timer2.time_left)
	
func _process(delta):
	$Timer.text = str(ceil($Timer2.time_left))	
