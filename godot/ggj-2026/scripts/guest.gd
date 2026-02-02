# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Guest
extends RigidBody2D

var mask: Mask
var hand: Hand
var initial_force: float = 1.0

@export var likes: Array[Mask.MaskTypes] = []

func _ready() -> void:
	hand = %Hand # get the Hand singleton when I spawn in
	mask = $Mask # get the child object named "Mask" when I spawn in
	mask.is_draggable = false
	init_likes()
	hand.register_guest(self)
	init_movement()

func init_likes():
	# like a random thing if none specified
	if not len(likes):
		likes = [randi_range(0, len(Mask.MaskTypes.keys()) - 1)]

	# show that you like that thing
	var like_displays = [$Heart/LikeMask1, $Heart/LikeMask2]
	like_displays[likes[0]].set_visible(true)

# mingle with the other guests
func init_movement():
	# start movement toward center of screen
	var center: Vector2 = get_viewport_rect().size / 2
	var direction: Vector2 = center - global_position
	self.apply_impulse(direction * initial_force)

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
	
	hand.calculate_score()
