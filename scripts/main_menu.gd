extends Node2D

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	pass

var is_switching := false

func _on_button_pressed() -> void:
	print("before scene switch to play")
	if is_switching:
		return
	is_switching = true

	get_tree().change_scene_to_file("res://scenes/example_click_node_3d.tscn")
	print("before scene switch to play")
	pass # Replace with function body.

func _on_scene_two_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
