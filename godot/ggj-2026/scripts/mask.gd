# Masks have interests that modify guest interests and can be dragged between guests and the hand
class_name Mask
extends Node2D

enum Interests {THING_1 = 1, THING_2 = 2, THING_3 = 3}
var hand:Hand

@export var attribute: Array[Interests] = [] # TODO: use enum of interests

func _ready() -> void:
	hand = %Hand

func _process(delta: float) -> void:
	# global_position = get_global_mouse_position()
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			#print(get_global_mouse_position(), shape_idx)
			hand.dragging_mask = self
		else:
			hand.dragging_mask = null
		
