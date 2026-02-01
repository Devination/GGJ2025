# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends Node2D

var mask: Mask
enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}

@export var likes: Array[Interests] = []

func _ready() -> void:
	mask = $Mask # get the child object named "Mask" at game start

func wear_mask(new_mask:Mask):
	# delete old mask
	if new_mask != mask:
		mask.queue_free()
	
	# apply new mask
	mask = new_mask
	mask.reparent(self)
	mask.position = Vector2.ZERO
	mask.rotation = 0
