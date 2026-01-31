extends Node2D

@export var possible_masks: Array[Mask]  = []
var masks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	masks = [$MaskPoint1, $MaskPoint2, $MaskPoint3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
