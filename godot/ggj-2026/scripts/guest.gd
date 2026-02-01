# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends Node2D

var mask: Mask
enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}

@export var likes: Array[Interests] = []

func _ready() -> void:
	mask = $Mask # get the child object named "Mask" at game start

func wear_mask(new_mask:Mask):
	print("Wearing mask: ", mask)
	# TODO: delete mask
	mask = new_mask
