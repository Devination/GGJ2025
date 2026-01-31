# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Mask
extends Sprite2D

enum Interests {THING_1, THING_2, THING_3}

@export var likes: Array[Interests] = [] # TODO: use enum of interests
@export var dislikes: Array[Interests] = [] # TODO: use enum of interests

func _ready() -> void:
	pass # Replace with function body.
