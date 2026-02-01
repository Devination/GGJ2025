# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Mask
extends Node2D

enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}
var hand: Hand
var area: Area2D

@export var attribute: Array[Interests] = [] # TODO: use enum of interests

func _ready() -> void:
	hand = %Hand
	area = $Area2D


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			#print(get_global_mouse_position(), shape_idx)
			hand.dragging_mask = self
		elif (event.button_index == MOUSE_BUTTON_LEFT
		 and event.is_released()
		 and hand.dragging_mask == self):
			hand.dragging_mask = null
			apply_mask_to_guest()

func apply_mask_to_guest():
	var bodies = area.get_overlapping_areas()
	for body in bodies:
		var guest := body.get_parent() as Guest
		guest.wear_mask(self)
