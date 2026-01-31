class_name Hand
extends Node2D

@export var possible_masks: Array[Mask]  = []
var mask_points = []

var dragging_mask: Mask

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mask_points = [$MaskPoint1, $MaskPoint2, $MaskPoint3]

func _process(delta: float) -> void:
	if dragging_mask:
		dragging_mask.global_position = get_global_mouse_position()
	#global_position = get_global_mouse_position()
	pass
