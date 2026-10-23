extends CanvasLayer

@export_file("*.tscn") var title_scene_path: String

func _ready() -> void:
	# Master Volume
	var volume = remap(SettingsManager.master_volume, 0, 1, 0, 100)
	%MasterVolumeSlider.value = volume
	%MasterVolumeLevelLabel.text = str(int(round(volume)))
	
	# Fullscreen
	%FullscreenCheckBox.button_pressed = SettingsManager.fullscreen

func _on_master_volume_slider_value_changed(value: float) -> void:
	SettingsManager.set_master_volume(remap(value, 0, 100, 0, 1))
	%MasterVolumeLevelLabel.text = str(int(round(value)))

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(title_scene_path)

func _on_save_button_pressed() -> void:
	SettingsManager.save_settings()

func _on_fullscreen_check_box_toggled(toggled_on: bool) -> void:
	SettingsManager.set_fullscreen(toggled_on)
