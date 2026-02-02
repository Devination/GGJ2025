extends Path2D

var guest_res: Resource = load("res://scenes/guest.tscn")

func spawn_guest():
	var guest = guest_res.instantiate() as Guest
	add_sibling(guest)
	var curve_length = curve.get_baked_length()
	var random_point = randf_range(0, curve_length)
	guest.global_position = curve.sample_baked(random_point)
	guest.init_movement()

func _on_timer_timeout() -> void:
	spawn_guest()
