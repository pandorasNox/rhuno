extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _on_scene_two_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
