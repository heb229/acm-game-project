extends CanvasLayer

@export_file("*.tscn") var level_select_path: String
@export_file("*.tscn") var settings_path: String

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file(level_select_path)

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file(settings_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
