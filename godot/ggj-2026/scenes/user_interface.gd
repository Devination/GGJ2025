
extends CanvasLayer

var score = 0
var timer = 0
# Function to update the label
func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)

# Call this function whenever the player collects an item
func _on_score_increased(amount):
	score += amount
	update_score_label()


func _on_timer_2_timeout() -> void:
	print("Party is over!")
func updateTimer():
	$Timer.text = str($Timer2.time_left)
func _process(delta):
	$Timer.text = str(ceil($Timer2.time_left))	
