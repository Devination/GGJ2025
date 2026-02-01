# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends Node2D

var mask: Mask

@export var likes: Array[Mask.MaskTypes] = []

func _ready() -> void:
	mask = $Mask # get the child object named "Mask" at game start
	mask.is_draggable = false
	init_likes()

func init_likes():
	# like a random thing if none specified
	if not len(likes):
		likes = [randi_range(0, len(Mask.MaskTypes.keys()) - 1)]

	# show that you like that thing
	var like_displays = [$Heart/LikeMask1, $Heart/LikeMask2]
	like_displays[likes[0]].set_visible(true)
	

func wear_mask(new_mask:Mask):
	# delete old mask
	if new_mask != mask and mask:
		mask.queue_free()
	
	# apply new mask
	mask = new_mask
	mask.reparent(self)
	mask.position = Vector2.ZERO
	mask.rotation = 0
	mask.is_draggable = false
