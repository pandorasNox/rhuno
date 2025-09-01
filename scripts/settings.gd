extends Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
