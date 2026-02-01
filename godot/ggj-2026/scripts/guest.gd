# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends Node2D

var mask: Mask

@export var likes: Array[Mask.MaskTypes] = []

func _ready() -> void:
	mask = $Mask # get the child object named "Mask" at game start
	init_likes() # like a random thing if none specified

func init_likes():
	if not len(likes):
		likes = [randi_range(0, len(Mask.MaskTypes.keys()) - 1)]

func wear_mask(new_mask:Mask):
	# delete old mask
	if new_mask != mask:
		mask.queue_free()
	
	# apply new mask
	mask = new_mask
	mask.reparent(self)
	mask.position = Vector2.ZERO
	mask.rotation = 0
