extends Line2D

var guest_res: Resource = load("res://scenes/guest.tscn")

func spawn_guest():
	var guest = guest_res.instantiate() as Guest
	add_sibling(guest)
	# TODO: sample random point from the GuestSpawner line to start from
	guest.global_position = Vector2.ZERO
	guest.init_movement()

func _on_timer_timeout() -> void:
	spawn_guest()
