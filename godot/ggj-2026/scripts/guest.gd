# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends Node2D

enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}

@export var likes: Array[Interests] = []

func _ready() -> void:
	pass
