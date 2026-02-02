class_name Hand
extends Node2D

@export var spawnable_masks: Array[Resource]  = [
	load("res://scenes/mask1.tscn"),
	load("res://scenes/mask2.tscn"),
	load("res://scenes/mask3.tscn")
]
var mask_points: Array[Node2D] = []
var guests: Array[Guest] = []
var dragging_mask: Mask
var spawner: GuestSpawner

func _ready() -> void:
	spawner = $"../GuestSpawner" as GuestSpawner
	mask_points = [$MaskPoint1, $MaskPoint2, $MaskPoint3]
	# spawn masks in hand
	spawn_mask(0)
	spawn_mask(1)
	spawn_mask(2)


func _process(_delta: float) -> void:
	if dragging_mask:
		dragging_mask.global_position = get_global_mouse_position()

func register_guest(guest: Guest) -> void:
	guests.append(guest)
	calculate_score()

func spawn_mask(mask_type: int) -> void:
	var mask = spawnable_masks[mask_type].instantiate() as Mask
	add_child(mask)
	# set the transform
	mask.global_position = mask_points[mask_type].global_position
	mask.rotation = mask_points[mask_type].rotation

func calculate_score() -> void:
	var score: int = 0
	var num_masks: Array[int] = []
	for mask_type in Mask.MaskTypes:
		num_masks.append(0)
	
	# count the masks - mask that the person is wearing
	for guest in guests:
		var guest_wears = guest.mask.attribute
		if guest_wears:
			num_masks[guest_wears[0]] += 1

	# add to score for each mask a guest sees (excluding their own)
	for guest in guests:
		var guest_likes = guest.likes[0]
		var guest_wears = -1
		var guest_wears_attr = guest.mask.attribute
		if guest_wears_attr:
			guest_wears = guest_wears_attr[0]
		
		# add to score for each mask that is worn
		score += num_masks[guest_likes]
		
		# subtract one if the guest is wearing it (they can't see their own mask)
		if guest_wears == guest_likes:
			score -= 1

	print("Score:", score)
	%UserInterface.update_score_label(score)

func restart_game() -> void:
	# reset unpause game
	Engine.time_scale = 1.0
	
	# remove all the guests
	for guest in guests:
		guest.queue_free()
	guests.clear()
		
	# spawn 2 starter guests
	spawner.spawn_guest()
	spawner.spawn_guest()
