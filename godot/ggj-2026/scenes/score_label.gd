extends CanvasLayer

var score = 0

# Function to update the label
func update_score_label():
	$ScoreLabel.text = "Score: " + str(score)

# Call this function whenever the player collects an item
func _on_score_increased(amount):
	score += amount
	update_score_label()
