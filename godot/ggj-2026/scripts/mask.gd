# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Mask
extends Node2D

enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}

@export var attribute: Array[Interests] = [] # TODO: use enum of interests

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#global_position = get_global_mouse_position()
	pass
