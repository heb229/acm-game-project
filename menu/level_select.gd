extends CanvasLayer

@export_file("*.tscn") var title_scene_path: String

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(title_scene_path)
