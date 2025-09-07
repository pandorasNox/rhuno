extends MeshInstance3D

var is_switching := false

func _on_area_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if not is_instance_valid(self):
		return

	call_deferred("_handle_input_event", event)

func _handle_input_event(event) -> void:
	print("Area3D _on_area_3d_input_event")
	
	if event is not InputEventMouseButton:
		print("hit check InputEventMouseButton")
		return
	print("after check InputEventMouseButton")
		
	if not event.pressed:
		print("hit check event.pressed")
		return
	print("after check event.pressed")

		
	if not event.button_index == MOUSE_BUTTON_LEFT:
		return
	print("after check event.button_index == MOUSE_BUTTON_LEFT")

	print("Object clicked")
	
	if not is_instance_valid(get_tree()):
		return

	print("before scene switch")	
	if is_switching:
		return
	is_switching = true

	var result = get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if result != OK:
		print("Scene change failed with error code: ", result)
	print("after scene switch")
